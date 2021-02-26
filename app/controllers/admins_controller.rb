class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :show, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def edit
  end

  def update    

  end

  def destroy    
    @admin.destroy
    redirect_to action: :index, notice: 'ユーザーが削除されました'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
  
end
