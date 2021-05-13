require'rails_helper'

RSpec.describe Item, type: :model do 
  describe "itemモデルのテスト" do     
    it "name, description, category_id, price, item_condition_id,shipping_date, shipping_fee, shipping_way, prefecture_idがあるとき､有効" do
      item = FactoryBot.build(:item)
      binding.pry
      # item.valid?
      expect(item).to be_valid
    end
  end
end