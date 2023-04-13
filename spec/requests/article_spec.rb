require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
      get '/articles'
    end

    it 'returns an http success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('articles/index')
    end
  end
end
