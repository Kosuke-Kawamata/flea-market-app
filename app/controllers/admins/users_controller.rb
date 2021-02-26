class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index    
    @users = User.all
  end
  
  def show    

  end

  def edit    

  end

  def update    

  end

  def destroy    
    @user.destroy
    redirect_to action: :index, notice: 'ユーザーが削除されました'
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:profile)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
