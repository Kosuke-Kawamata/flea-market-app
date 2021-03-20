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
    redirect_to homes_mypage_path
  end
  
  # private
  # def user_params
  #   params.require(:user).permit(:name,:profile)
  # end

end
