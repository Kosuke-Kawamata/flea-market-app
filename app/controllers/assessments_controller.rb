class AssessmentsController < ApplicationController
  before_action :set_item, only: [:create]
  def create
    if current_user.id == @item.buyer_id
      assessment = Assessment.create!(assessment_params)  
      assessment.for_seller!
      @item.buyer_assessed!
      redirect_to transaction_item_path(@item)    
    elsif current_user.id == @item.user_id
      assessment = Assessment.create!(assessment_params)  
      assessment.for_buyer!
      @item.seller_assessed!
      redirect_to transaction_item_path(@item)
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def assessment_params
    params.require(:assessment).permit(:user_rank, :message, :trading_partner_id, :user_id)
  end
end
