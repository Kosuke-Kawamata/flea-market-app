class ChargesController < ApplicationController
  before_action  :authenticate_user!

  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    
    # stripe購入機能
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @item.price,
      description: "商品ID:#{@item.id} 商品名:#{@item.name}",
      currency: 'jpy',
    })

    if @item.update(sold_flag: true, buyer_id: current_user.id)
      @item.in_process!
      redirect_to item_path(params[:item_id]), notice: "商品を購入しました！"
    end
    
    # チャット機能
    @room = @item.rooms.create!
    @room.close_chat!
    UserRoom.create(room_id: @room.id, user_id: @item.buyer_id)
    UserRoom.create(room_id: @room.id, user_id: @item.user_id)
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
