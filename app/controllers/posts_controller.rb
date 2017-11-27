class PostsController < ApplicationController

  before_action :check_if_logged_in, :only => [:posts]
  before_action :own_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new post_params
    if @post.save
      @current_user.posts << @post
      redirect_to user_path(@current_user.id)
    else
      flash[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    user = @current_user
    if @post.update post_params
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def index
    @posts = Post.order(:created_at)
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to user_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :photograph, :caption)
  end

  def own_post
    unless @current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to user_path
    end
  end

end
