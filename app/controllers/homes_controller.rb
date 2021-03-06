class HomesController < ApplicationController
  def top
    @user = User.all
  end

  def mypage    
    @items = Item.all
  end

  def company_description    
  end
end
