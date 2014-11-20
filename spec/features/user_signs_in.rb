require 'rails_helper'

feature 'Visitor signs in' do

  scenario 'with valid email and password' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect( page ).to have_content('Signed in successfully')
  end
end

feature 'Visitor does not sign in' do
  scenario 'with invalid email' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'papa@invalid.com'
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect( page ).to have_content('Invalid email or password')
  end

  scenario 'with blank password' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    click_button 'Log in'
    expect( page ).to have_content('Invalid email or password')
  end
end
