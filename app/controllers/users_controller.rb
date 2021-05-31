class UsersController < ApplicationController
  before_action :set_user
  before_action :remove_image, only: [:destroy]

  def show
    @user_items = @user.items
    @user_assessments = Assessment.all.where(trading_partner_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update!(user_params)
      redirect_to user_path(current_user)
    else      
      # redirect_to edit_user_path(current_user)
      render :edit
    end
  end

  def mypage    
    @my_items = current_user.items.where.not(status: :pre_published)
    @my_items = current_user.items.where.not(status: :pre_published).page(params[:page]).per(5)
  end

  def like_items
    @liked_items = current_user.liked_items
    @liked_items = current_user.liked_items.page(params[:page]).per(5)
  end

  def commented_items
    @commented_items = current_user.commented_items
    @commented_items = current_user.commented_items.page(params[:page]).per(5)
  end

  def pre_published_items
    @pre_published_items = current_user.items.pre_published
    @pre_published_items = current_user.items.pre_published.page(params[:page]).per(5)
  end
  
  def published_items
    @published_items = current_user.items.published
    @published_items = current_user.items.published.page(params[:page]).per(5)
  end
  
  def selling_items
    @selling_items = current_user.items.where(sold_flag: true).where.not(status: :seller_assessed)
    @selling_items = current_user.items.where(sold_flag: true).where.not(status: :seller_assessed).page(params[:page]).per(5)
  end
  
  def sold_items
    @sold_items = current_user.items.where(sold_flag: true).seller_assessed
    @sold_items = current_user.items.where(sold_flag: true).seller_assessed.page(params[:page]).per(5)
  end
  
  def buying_items
    @items = Item.all
    @buying_items = @items.where(buyer_id: current_user.id).where.not(status: :seller_assessed)
    @buying_items = @items.where(buyer_id: current_user.id).where.not(status: :seller_assessed).page(params[:page]).per(5)
  end
  
  def bought_items
    @items = Item.all
    @bought_items = @items.where(buyer_id: current_user.id).seller_assessed
    @bought_items = @items.where(buyer_id: current_user.id).seller_assessed.page(params[:page]).per(5)
  end
  
  def assessments_list
    @assessments = Assessment.all
    @current_user_assessment = @assessments.where(trading_partner_id: current_user.id)
    @current_user_assessment = @assessments.where(trading_partner_id: current_user.id).page(params[:page]).per(5)
  end

  def following_user
    @following_persons = current_user.followings
    @following_persons = current_user.followings.page(params[:page]).per(5)
  end
  
  def profile_page
    @user_assessments = Assessment.all.where(trading_partner_id: current_user.id)
  end
  

  private

  def user_params
    params.require(:user).permit(:name,:profile,:img)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def remove_image
    @user.remove_img!
  end
end
