require 'rails_helper'

RSpec.describe "UserAUthentications", type: :request do
  let(:user) {create(:user)}
  let(:user_params) {attributes_for(:user)}
  let(:invalid_user_params) {attributes_for(:user, name:"")}

  describe 'POST #create' do
    context 'パラメーターが妥当なとき' do
      it 'リクエストが成功すること' do 
        post user_registration_path, params: {user: user_params}
        expect(response.status).to eq 302
      end
      it 'createが成功すること' do
        expect do
          post user_registration_path, params: {user: user_params}
        end.to change{User.count}.by(1)
      end
      it 'リダイレクトされること' do
        post user_registration_path, params: {user: user_params}
        expect(response).to redirect_to user_mypage_path(User.find_by(email: user_params[:email]).id)
      end
    end
    context 'パラメーターが不正なとき' do
      it 'リクエストがせいこうすること' do
        post user_registration_path, params: {user: invalid_user_params}
        expect(response.status).to eq 200
      end
      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: {user: invalid_user_params}
        end.to change{User.count}.by(0)
      end
    end
  end
end