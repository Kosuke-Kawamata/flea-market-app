class ItemsController < ApplicationController
  before_action  :authenticate_user!, only: [:new, :edit, :delete_img, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    # if current_user   
    #   @items = Item.where.not(user_id: current_user.id)
    # else
    #   @items = Item.all          
    # end    
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
      redirect_to item_path(@item)
    else
      render :new
    end
    
  end
  
  
  def show
  end
  
  def edit
    @categories = Category.all
  end
  # def delete_img
  #   @item.remove_img
  #   @item.save
  #   redirect_to :edit
  # end
  
  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end
  
  def destroy    
    @item.destroy
    redirect_to homes_mypage_path
  end
  
  def transaction
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :img, :price).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find_by(id: params[:id])
  end
  
end
