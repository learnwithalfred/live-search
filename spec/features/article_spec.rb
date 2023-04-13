require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  describe 'GET #index' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @article1 = FactoryBot.create(:article, user: @user)
      @article2 = FactoryBot.create(:article, user: @user)
      sign_in @user
    end

    context 'with a search query' do
      before { visit articles_path(query: @article1.title) }

      it 'displays articles matching the search query' do
        expect(page).to have_content(@article1.title)
        expect(page).not_to have_content(@article2.title)
      end

      it 'creates a search record with the query and user id' do
        expect(Search.last.query).to eq(@article1.title)
        expect(Search.last.user_id).to eq(@user.id)
      end
    end

    context 'without a search query' do
      before { visit articles_path }

      it 'displays all articles' do
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article2.title)
      end

      it 'does not create a search record' do
        expect(Search.count).to eq(0)
      end
    end
  end
end
