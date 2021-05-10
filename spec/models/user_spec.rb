require'rails_helper'

RSpec.describe  User, type: :model do 
  describe "userモデルのテスト" do     
    it "name, email, passwordがあるとき､有効" do
      user = User.new(name: 'テスト1', email: 'test.test@test.com', password: 'testtest')
      user.valid?
      expect(user).to be_valid
    end
    
    it "nameが重複している場合､有効" do
      user_1 = FactoryBot.create(:user, name:'たろう')
      user_2 = FactoryBot.create(:user, name:'たろう')
      user_2.valid?
      expect(user_2).to be_valid
    end
    
    it "nameがない場合､無効" do
      user = FactoryBot.build(:user, name:'')
      user.valid?
      expect(user).not_to be_valid
    end
    
    it "emailがない場合､無効" do      
      user = FactoryBot.build(:user, email:'')
      user.valid?
      expect(user).not_to be_valid
    end
    
    it "passwordがない場合､無効" do
      user = FactoryBot.build(:user, password:'')
      user.valid?
      expect(user).not_to be_valid
    end

    let(:user_2) {FactoryBot.build(:user, email:'test@test.com')}
    it "emailが重複している場合､無効" do
      user_1 = FactoryBot.create(:user, email:'test@test.com')
      user_2.valid?
      expect(user_2).to be_invalid
    end
  end

  describe '#follow' do
    before do
      @following = FactoryBot.create(:user, name:'テスト1')
      @followed = FactoryBot.create(:user, name:'テスト2')
    end

    it 'relationのレコードができる' do
      @following.follow(@followed)
      expect(Relationship.find_by(user_id: @following.id).follower_id).to eq @followed.id
    end
  end
end
