class ChatsController < ApplicationController
  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save!
    redirect_to item_path(@chat.room.item)
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :user_id, :room_id)
  end
end






