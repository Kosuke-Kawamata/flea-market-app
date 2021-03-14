class ChatsController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save!

    if (current_user.id == @item.user_id && @item.sold_flag == true)|| current_user.id == @item.buyer_id #user_idがnil @itemもnil
      redirect_to transaction_item_path(@item)
    else
      redirect_to item_path(@item)
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    if current_user.id == @chat.user_id
      @chat.destroy    

      if (current_user.id == @item.user_id && @item.sold_flag == true)|| current_user.id == @item.buyer_id #user_idがnil @itemもnil
        redirect_to transaction_item_path(@item)
      else
        redirect_to item_path(@item)
      end
      
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :user_id, :room_id, :item_id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end






