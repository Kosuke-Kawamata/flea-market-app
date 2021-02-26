module CategoriesHelper
  def editable_item(user, item)
    user && user.id == item.user_id
   end
end
