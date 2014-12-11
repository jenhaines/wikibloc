require 'rails_helper'
require './helpers/'


feature 'User creates new wiki' do

  scenario 'with title and body' do
    sign_in
    click_button 'New Wiki'
    fill_in 'Title', with: 'This is my Title'
    fill_in 'Body', with: 'This is the body of my wiki. wahoo!'
    click_button 'Save'
    expect(page).to have_content('Post was saved')
  end
end
