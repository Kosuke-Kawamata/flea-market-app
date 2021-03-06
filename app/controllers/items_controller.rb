class ItemsController < ApplicationController
  before_action  :authenticate_user!, only: [:new, :edit, :delete_img, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  
  # items#showがchatのformを入力する場所
  def show
    
    @room = @item.rooms.first
    @chat = Chat.new(room_id: @room.id, user_id: current_user.id)
    @chats = @room.chats

    UserRoom.create(room_id: @room.id, user_id: current_user.id)

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
    # charge_controllerで決済時に@item.room.newをしてsave｡一応､user_room とも紐付けとく｡
    # そのあと､ここの transaction action にて､ room = @item.rooms.last でroom を引っ張ってくる｡
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
  
end
