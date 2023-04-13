require 'rails_helper'

RSpec.feature 'Searches', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    context 'when the user has no searches' do
      before { visit searches_path }

      it { expect(current_path).to eq(searches_path) }
      it { expect(page).to have_content('0 Searches') }
    end
  end

  context 'when user is not logged in' do
    before { sign_out @user }

    it 'should redirect to the sign in page when user not logged-in' do
      visit searches_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
