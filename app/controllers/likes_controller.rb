class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])

    unless @item.liked_by?(current_user)
      like = current_user.likes.new(item_id: @item.id)
      like.save!
      redirect_to @item
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy!
    redirect_to @item
  end
end
