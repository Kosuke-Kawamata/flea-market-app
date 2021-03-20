class ItemsController < ApplicationController
  before_action  :authenticate_user!, only: [:new, :edit, :delete_img, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :transaction, :shipped, :recieved, :assess_buyer]
  before_action :set_q, only: [:index, :search]

  def index
    @items = Item.all
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @item = Item.new    
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      @item.rooms.create! #アイテム作成時に､@itemに紐付いた､roomを作成・保存する

      redirect_to item_path(@item)
    else
      render :new
    end
    
  end
  
  # items#showがchatのformを入力する場所でもある
  def show   
    if current_user
      @room = @item.rooms.first
      @chat = Chat.new(room_id: @room.id, user_id: current_user.id, item_id: @item.id)
      @chats = @room.chats
  
      unless current_user.user_rooms.pluck(:room_id).include?(@item.rooms.first.id)
        UserRoom.create(room_id: @room.id, user_id: current_user.id)
      end
    end
    
  end
  
  def edit
    @categories = Category.all
  end
  
  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end
  
  def destroy    
    @item.destroy
    redirect_to homes_mypage_path
  end
  
  def transaction
    # charge_controllerで決済時に@item.room.create! user_roomモデルとも紐付け
    # transaction action にて､ room = @item.rooms.last でプライベートチャットroomを引っ張ってくる｡
    @room = @item.rooms.last
    if @room.close_chat?
      @chat = Chat.new(room_id: @room.id, user_id: current_user.id, item_id: @item.id)
      @chats = @room.chats
    else
      redirect_to item_path(@item)
    end  

    if @item.shipped? || @item.buyer_assessed?
      @assessment = Assessment.new
    end
    
  end
  
  def shipped
    @item.shipped!
    redirect_to transaction_item_path(@item)
  end


  def search
    @results = @q.result
    @items = Item.all
    @categories = Category.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :img, :price).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def chat_params
    # params.require(:chat).permit(:message)
    params.require(:chat).permit(:message, :user_id, :room_id)
  end

  def set_q
    @q = Item.ransack(params[:q])
  end
  
end
