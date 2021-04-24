class RemoveImgFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :img, :string
  end
end
