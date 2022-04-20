class UsersController < ApplicationController
  before_action :require_no_authentification, only: %i[new create]
  before_action :set_user!, only: %i[edit destroy update followers following]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :followers, :following]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @user.update user_params
      flash[:success] = 'Your profile was updated!'
      redirect_to home_path
    else
      render :edit
    end
  end

  def index
    @users = User.where(activated: true).page params[:page]
    @users = User.all.page params[:page]
  end

  def show
    @user = User.find(params[:id])
    @micropost = current_user.microposts.build
    @microposts = @user.microposts.page params[:page]
  end

  def followers
    @title = "Followers"
    @users = @user.followers.page params[:page]
    render 'show_follow'
  end

  def following
    @title = "Following"
    @users = @user.following.page params[:page]
    render 'show_follow'
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to users_path
  end

  private 

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password)
  end

  def set_user!
    @user = User.find(params[:id])
  end

  def correct_user
    set_user!
    redirect_to home_path unless @user == current_user
  end

  def admin_user
    redirect_to(home_path) unless current_user.admin?
  end

  helper_method :set_user!
end
