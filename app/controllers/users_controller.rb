class UsersController < ApplicationController
	require 'pry'
	before_action :require_no_authentification, only: %i[new create]
	before_action :require_no_authentification, only: %i[edit update]
	before_action :set_user!

	def new
		@user=User.new
	end

	def create
		@user=User.new user_params
		if @user.save
			session[:user_id]=@user.id
			redirect_to home_path
		else
			render :new
		end
	end

	def edit

	end

	def update

	end
	


	private def user_params

		params.require(:user).permit(:email, :name, :password, :password_confirmation)

	end

	def set_user!
		@user=User.find(params[:id])
	end	
end
