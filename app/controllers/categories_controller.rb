class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @categories = Category.all
    @category_items = @category.items
    @category_items = @category.items.page(params[:page]).per(4)
  end
end
