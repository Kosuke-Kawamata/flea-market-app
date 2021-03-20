class RelationshipsController < ApplicationController  
  def create
    @user = User.find(params[:user_id])
    @other_user = User.find(params[:follower_id])
    current_user.follow(@other_user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])

    # @user = current_user.relationships.find(params[:id]).follower_id # ←これの役割がわからない､
    current_user.unfollow(params[:id])
    redirect_to user_path(@user)
  end
end


# user.rb のモデルメソッド------------------------------------------

# def follow(other_user)
#   return if self == other_user
#   relationships.find_or_create_by!(follower: other_user)
# end

# def following?(user)
#   followings.include?(user)
# end

# def unfollow(relathinoship_id)
#   relationships.find(relathinoship_id).destroy!
# end

# ----------------------------------------------------------------


