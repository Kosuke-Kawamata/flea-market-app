class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :set_categories

  def set_categories
    @parent_categories = Category.where(ancestry: nil).to_a
    gon.child_categories = []
    gon.grandchild_categories = []

    @parent_categories.each do |parent|
      # 子供の配列
      gon.child_categories << parent.children.to_a
    end

    gon.parent_array = []    
    for childArray in gon.child_categories
      child_array = []
      childArray.each do |childElement|
        child_array << childElement.children.to_a
      end
      gon.parent_array << child_array
    end    
  end

  def set_search
    @search = Item.ransack(params[:q])
  end  
end
