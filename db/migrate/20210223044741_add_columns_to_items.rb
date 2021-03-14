class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :price, :integer
    add_column :items, :status, :integer, default: 0, null: false
    add_column :items, :sold_flag, :boolean, default: false    
    add_column :items, :buyer_id, :integer    
  end
end
