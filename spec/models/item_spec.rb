require'rails_helper'

RSpec.describe Item, type: :model do 
  let(:user) {FactoryBot.create(:user)}
  let(:brand) {FactoryBot.create(:brand)}
  let(:default) {{user: user, brand: brand}}
  describe "itemモデルのバリデーションのテスト" do
    context 'name, description, category_id, price, item_condition_id,shipping_date, shipping_fee, shipping_way, prefecture_idがあるとき' do
      it "アイテムが保存される" do
        item = FactoryBot.build(:item, default)
        expect{item.save}.to change{Item.count}.by(1)
      end      
    end
    describe 'nameのバリデーションテスト' do      
      context 'nameがないとき' do      
        it 'バリデーションエラーがでる' do
          data = default.merge(name: nil)
          item = FactoryBot.build(:item, data)
          expect(item).to be_invalid
        end
      end
      context 'nameが26文字以内のとき' do      
        it 'バリデーションが通る' do
          data = default.merge(name: 'aaaaaaa')
          item = FactoryBot.build(:item, data)
          expect(item).to be_valid
        end
      end
      context 'nameが26文字以上のとき' do      
        it 'バリデーションエラーがでる' do
          data = default.merge(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
          item = FactoryBot.build(:item, data)
          expect(item).to be_invalid
        end
      end
    end
    context 'descriptionがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(description: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'category_idがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(category_id: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'priceがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(price: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'item_condition_idがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(item_condition_id: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'shipping_dateがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(shipping_date: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'shipping_feeがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(shipping_fee: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'shipping_wayがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(shipping_way: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
    context 'prefecture_idがないとき' do
      it 'バリデーションエラーがでる' do
        data = default.merge(prefecture_id: nil)
        item = FactoryBot.build(:item, data)
        expect(item).to be_invalid
      end
    end
  end  
  describe '#liked_by?' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:brand) {FactoryBot.create(:brand)}
    let!(:item) {FactoryBot.create(:item, user: user, brand: brand)}    
    context 'likeテーブルに一致するレコードがあるとき' do
      before do
        like = FactoryBot.create(:like, user:user, item:item)
      end
      it 'trueを返す' do
        expect(item.liked_by?(user)).to eq true
      end    
    end
    context 'likeテーブルに一致するレコードがないとき' do      
      it 'falseを返す' do
        expect(item.liked_by?(user)).to eq false
      end
    end
  end
end