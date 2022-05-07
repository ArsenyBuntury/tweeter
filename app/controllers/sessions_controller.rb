class SessionsController < ApplicationController
  before_action :require_no_authentification, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.activated?
      sign_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or_to user
      else 
        message = "Account not activated!"
        message = "Check your email for the activation link"
        flash[:warning] = message
        redirect_to home_path
      end
    else
      flash.alert = 'Incorrect email and/or password'
      redirect_to new_session_path
      end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end
