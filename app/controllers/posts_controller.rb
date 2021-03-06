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
    cloudinary = Cloudinary::Uploader.upload( params[ "post" ][ "photograph" ] )

    @post = Post.new post_params
    @post.photograph = cloudinary['url']
    
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
    @post = @current_user.posts
    if @post.update post_params
      redirect_to post_path
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def index
    @posts = Post.all.order(:created_at)
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to user_path(@current_user.id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :photograph, :caption)
  end

  def own_post
    unless @current_user.post_ids.include? params[:id].to_i
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to user_path
    end
  end

end
