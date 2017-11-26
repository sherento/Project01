class PostsController < ApplicationController

  before_action :check_if_logged_in, :only => [:post]
  before_action :own_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new user_params
    if @post.save
      redirect_to user_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    user = @current_user
    if @post.update post_params
      redirect_to user_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def index
    @post = Post.all
  end

end


private

def own_post
  unless @current_user == @post.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to posts_path
  end
end
