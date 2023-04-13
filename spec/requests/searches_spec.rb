require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe '#index' do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
      get '/articles'
    end

    it 'returns a successful response' do
      get searches_url
      expect(response).to be_successful
    end

    it 'assigns @search_results' do
      FactoryBot.create(:search, user: @user, query: 'query1')
      FactoryBot.create(:search, user: @user, query: 'query2')

      get searches_url
      expect(assigns(:search_results)).to eq({ 'query1' => 1, 'query2' => 1 })
    end

    it 'filters the search results by the current user' do
      @other_user = FactoryBot.create(:user)
      FactoryBot.create(:search, user: @user, query: 'query1')

      get searches_url
      expect(assigns(:search_results)).to eq({ 'query1' => 1 })
    end
  end
end
