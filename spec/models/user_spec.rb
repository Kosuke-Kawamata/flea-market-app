require'rails_helper'

RSpec.describe  User, type: :model do 
  describe "userモデルのテスト" do     
    it "保存できる" do
      user = User.new(name: 'テスト1', email: 'test.test@test.com', password: 'testtest')
      user.valid?
      expect(user).to be_valid
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
