require 'spec_helper'

feature 'User sign in' do
  let!(:user) { FactoryGirl.create :user }
  let(:login_url) { 'http://www.example.com/login' }

  scenario 'signs in with valid credentials' do
    visit root_path
    click_link 'Login'
    page.current_url.should eq login_url

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'

    page.should have_content 'You are now logged in.'
    page.current_url.should eq emails_url
  end
end
