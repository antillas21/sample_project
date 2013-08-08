require 'spec_helper'

feature 'User Signup' do
  scenario 'new record' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'Test User'
    fill_in 'Email', with: 'user@example.com'
    password_field_id = 'user_password'
    fill_in password_field_id, with: 'password'
    password_confirmation_field_id = 'user_password_confirmation'
    fill_in password_confirmation_field_id, with: 'password'
    click_button 'Sign up'

    page.should have_content 'You have signed up successfully and are now logged in.'
    page.current_url.should eq emails_url
    page.should_not have_content 'Sign up'
  end

  scenario 'exisiting record' do
    User.create( name: 'Existing User', email: 'user@example.com', password: 'password' )

    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'Test User'
    fill_in 'Email', with: 'user@example.com'
    password_field_id = 'user_password'
    fill_in password_field_id, with: 'password'
    password_confirmation_field_id = 'user_password_confirmation'
    fill_in password_confirmation_field_id, with: 'password'
    click_button 'Sign up'

    page.should have_content 'Email has already been taken'
    page.current_url.should eq signup_url
  end
end
