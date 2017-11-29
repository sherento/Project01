
class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit]

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
      redirect_to user_path(@user.id)
    else
      render :new
    end

  end

  def edit
    @user = User.find params[:id]
  end

  def update

    user = @current_user

    cloudinary1 = Cloudinary::Uploader.upload( params[ "user" ][ "profile" ] )
    cloudinary2 = Cloudinary::Uploader.upload( params[ "user" ][ "header" ] )
    params["user"]["profile"] = cloudinary1['url']
    params["user"]["header"] = cloudinary2['url']


    user.update user_params
    redirect_to user_path
  end


  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :header)
  end
end
