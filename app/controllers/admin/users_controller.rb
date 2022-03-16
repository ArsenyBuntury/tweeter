class Admin::UsersController < ApplicationController
before_action :require_authentication

def index
	@user = User.find(params[:id]).order(created_at :desc)
end

end