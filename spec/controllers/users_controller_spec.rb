require'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    let(:users) { FactoryBot.create_list :user, 2 }

    it 'リクエストが成功すること' do
      get :index
      expect(response.status).to eq 200
    end

    it 'indexテンプレートで表示されること' do
      get :index
      expect(response).to render_template :index
    end

    it '@usersが取得できていること' do
      get :index
      expect(assigns :users).to eq users
    end
  end
end