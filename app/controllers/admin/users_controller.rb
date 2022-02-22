# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :require_authentication
    before_action :set_user!

    def index
      @user = User.find(params[:id])
    end

    def edit; end

    def update
      if @user.update user_params
        flash[:success] = 'Success!'
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def set_user!
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:email, :name, :password,
                                   :password_confirmation)
    end
  end
end
