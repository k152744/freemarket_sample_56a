require 'rails_helper'
describe UsersController, type: :request do
  describe 'GET #index' do
    before do
      @user = FactoryBot.create(:takashi)
    end

    it 'リクエストが成功すること' do
      sign_in @user
      get users_url
      expect(response.status).to eq 200
    end
  end
end