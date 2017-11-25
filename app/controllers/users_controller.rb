
class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit]
  #before_action :check_if_admin, :only => [:index] #required? since show users to follow?

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to users_path #same as create above, take user to their profile page
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
