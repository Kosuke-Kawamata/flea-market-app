class HomesController < ApplicationController
  def top
    @user = User.all
  end

  def mypage    
    @items = Item.all 
    @assessments = Assessment.all
    @user_assessments = Assessment.all.where(trading_partner_id: current_user.id)
  end

  def company_description    
  end
end
