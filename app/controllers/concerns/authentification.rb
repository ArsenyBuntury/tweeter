module Authentification
  extend ActiveSupport::Concern
  included do
    private

    def current_user
      if session[:user_id]
        set_user_id!.decorate
      elsif cookies.encrypted[:user_id].present?
        user = User.find_by(id: user_id)
        if user&.authenticated?(:remember, cookies.encrypted[:remember_token])
          sign_in user
          @current_user = user.decorate
        end
      end
    end

    def user_signed_in?
      current_user.present?
    end

    def require_no_authentification
      return unless user_signed_in?

      redirect_to home_path
    end

    def require_authentication
      return if user_signed_in?

      flash[:warning] = t 'global.flash.not_signed_in'
      redirect_to home_path
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def remember(user)
      user.remember_me
      cookies.encrypted.permanent[:remember_token] = user.remember_token
      cookies.encrypted.permanent[:user_id] = user.id
    end

    def forget(user)
      user.forget_me
      cookies.delete :user_id
      cookies.delete :remember_token
    end

    def sign_out
      forget current_user
      session.delete :user_id
      @current_user = nil
    end

    def set_user_id!
      @current_user ||=User.find_by(id: session[:user_id]).decorate
      
    end

    helper_method :current_user, :user_signed_in?
  end
end
