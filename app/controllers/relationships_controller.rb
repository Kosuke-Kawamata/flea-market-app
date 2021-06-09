class RelationshipsController < ApplicationController  
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower # @userにフォロー相手をいれている
    current_user.unfollow(params[:id])
  end
end


