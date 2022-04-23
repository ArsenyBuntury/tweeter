class AccountActivationsController < ApplicationController

    def edit
        user = User.find_by(email: params[:email], id: params[:id])

        # You HAVE to pass params[:id] above
        if user && !user.activated? && user.authenticated?(:activation)
            user.activate
            user.update_attribute(:activated, true)
            user.update_attribute(:activated_at, Time.zone.now)
            sign_in user
            flash[:success] = "Account activated!"
            redirect_to user
        else
            flash[:danger] = "Invalid activation link"
            redirect_to home_path
        end
    end
end
