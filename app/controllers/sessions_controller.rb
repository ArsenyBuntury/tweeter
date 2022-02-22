# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentification, only: %i[new create]

  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      remember(user) if params[:remember_me] == '1'
      session[:user_id] = user.id
      redirect_to home_path
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
