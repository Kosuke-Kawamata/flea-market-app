class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :item_id
      t.integer :chat_type, default: 0, null: false
      t.timestamps
    end
  end
end
