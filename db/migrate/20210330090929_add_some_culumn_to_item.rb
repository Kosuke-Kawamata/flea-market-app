class AddSomeCulumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :brand, foreign_key: true
    add_column :items, :prefecture_id, :integer
    add_column :items, :item_condition_id, :integer
    add_column :items, :shipping_fee, :integer
    add_column :items, :shipping_date, :integer
    add_column :items, :shipping_way_id, :integer
  end
end
