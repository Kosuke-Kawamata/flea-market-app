class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @user_items = @user.items
    @user_assessments = Assessment.all.where(trading_partner_id: @user.id)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_mypage_path(current_user)
  end

  def mypage    
    @items = Item.all 
    @assessments = Assessment.all
    @user_assessments = Assessment.all.where(trading_partner_id: current_user.id)
  end

  def like_items
  end

  def commented_items
    
  end

  def pre_published_items
  end
  
  def published_items
  end
  
  def selling_items
  end
  
  def sold_items
  end
  
  def buying_items
    @items = Item.all
  end
  
  def bought_items
    @items = Item.all
  end
  
  def assessments_list
    @assessments = Assessment.all
  end
  
  def profile_page
    @user_assessments = Assessment.all.where(trading_partner_id: current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:profile,:img)
  end

end
