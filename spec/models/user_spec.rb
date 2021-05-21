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
    # どっちがいいの？ たぶん､保存できるか出来ないかをテストしたいから､.saveを使う方が分かりやすいかな？
    let(:user_2) {FactoryBot.build(:user, email:'test@test.com')}
    it "emailが重複している場合､無効" do
      user_1 = FactoryBot.create(:user, email:'test@test.com')
      user_2.valid?
      expect(user_2).to be_invalid
    end
    it "emailが重複している場合､無効" do
      user_1 = FactoryBot.create(:user, email:'test@test.com')
      user_2.valid?
      expect(user_2.save).to be_falsey
    end
  end
  describe '#follow' do
    before do
      @following = FactoryBot.create(:user, name:'テスト1')
      @followed = FactoryBot.create(:user, name:'テスト2')
    end
    it 'フォローした人・された人がペアになったレコードがrelationshipsテーブルに作成される' do
      @following.follow(@followed)
      expect(Relationship.find_by(user_id: @following.id).follower_id).to eq @followed.id
    end
  end
  describe '#following?' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
    end
    context 'user1がuser2をフォローしている場合' do
      before do
        @user1.follow(@user2)
      end
      it 'trueが返ってくる' do        
        expect(@user1.following?(@user2)).to be_truthy
      end
    end        
    context 'user1がuser2をフォローしていない場合' do
      it 'falseが返ってくる' do
        expect(@user1.following?(@user2)).to be_falsey
      end
    end
  end
end
describe '#unfollow' do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user1.follow(@user2)
    @relationship = @user1.relationships.find_by(follower_id: @user2)
  end
  context '@user1が@user2をフォローしているとき' do    
    it 'unfollowの引数に@user2.idを渡すと@user1と@user2のidがペアになっているrelationshipレコードが削除される' do
      expect{@user1.unfollow(@relationship.id)}.to change{@user1.relationships.size}.by(-1)
    end
  end
end