class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])
    @categories = Category.all
  end
  

  private

  # def category_params
  #   params.require(:category).permit(:name)
  # end

  # def set_category
  #   @category = Category.find_by(id: category_id)
  # end

end
