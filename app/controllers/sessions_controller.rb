class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by email: params[:email]
		if user&.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to home_path
		else
		flash.alert= "Incorrect email and/or password"
		redirect_to new_session_path
		end
	end

	def destroy

	end

end
