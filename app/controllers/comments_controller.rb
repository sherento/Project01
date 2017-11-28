class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments. comment_params
    @comment.user_id = @current_user.id

    if @comment.save
      redirect_to posts_path(@post.id)
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render posts_path(@post.id)
    end
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
