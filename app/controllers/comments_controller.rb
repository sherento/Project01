class CommentsController < ApplicationController

  before_action :set_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params

      if @comment.save
        @post.comments << @comment
        redirect_to post_path(@post)
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      redirect_to posts_path(@post.id)
    end
  end

  def show
    @comment = Post.find(params[:id])
  end

  def index
    @comment = Comment.all.order(:created_at)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
