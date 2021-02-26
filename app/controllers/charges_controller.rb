class ChargesController < ApplicationController
  before_action  :authenticate_user!

  def new
  end
  
  def create
    # Amount in cents
    @item = Item.find(params[:item_id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @item.price,
      description: "商品ID:#{@item.id} 商品名:#{@item.name}",
      currency: 'jpy',
    })

    if @item.update(sold_flag: true, buyer_id: current_user.id)
      redirect_to item_path(params[:item_id]), notice: "商品を購入しました！"
    end
  # formから女王を贈り､パラメーターで取得する際には､require・permitとかを定義する必要がある｡ でも､今回のupdateはparams から情報を受け取っているわけではなく､"sold_flag: true"という固定の値を"sold_flag"に上書きしているだけだから､permitとかはいらない｡
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
