module Authentification
	extend ActiveSupport::Concern
	require 'pry'
	included do
private 

	def current_user
		@current_user ||= User.find_by(id: session[:user_id]).decorate if session[:user_id].present?
	end


	def user_signed_in?
		current_user.present?
	end

	def require_no_authentification
		return if !user_signed_in?
		redirect_to home_path
	end

	def sign_out
	session.delete :user_id
	@current_user=nil	
	end

	helper_method :current_user, :user_signed_in?
	end
end