class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :set_categories

  def set_categories
    @categories = Category.all
  end

  def set_search
    @search = Item.ransack(params[:q])
  end  
end
