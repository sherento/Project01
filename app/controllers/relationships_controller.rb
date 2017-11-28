
class RelationshipsController < ApplicationController

  def follow_user
    @user = User.find_by! id: params[:user_id]
    if @current_user.follow @user
      respond_to do |format|
        format.html { redirect_to follow_user_path(@user.id) }
        format.js {}
      end
    end
  end

  def unfollow_user
    @user = User.find_by! id: params[:user_id]
    if @current_user.unfollow @user
      respond_to do |format|
        format.html { redirect_to unfollow_user_path(@user.id) }
        format.js {}
      end
    end
  end

end
