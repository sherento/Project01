class PostsController < ApplicationController

  before_action :check_if_logged_in, :only => [:post]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    redirect_to user_path
  end

  def create
    @post = Post.new post_params
    if @post.save
      session[:user_id] = @post.id
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    user = @current_user
    post.update post_params
    redirect_to users_path
  end

  def index
    @post = Post.all
  end

end
