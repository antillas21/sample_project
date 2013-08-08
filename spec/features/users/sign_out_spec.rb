require 'spec_helper'

feature 'User sign out' do
  let!(:user) { FactoryGirl.create :user }
  let(:login_url) { 'http://www.example.com/login' }

  before do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end

  scenario 'signs out successfully' do
    click_link 'Logout'
    page.current_url.should eq root_url
    page.should have_content 'You logged out successfully.'
    page.should_not have_content 'Logout'
  end
end
