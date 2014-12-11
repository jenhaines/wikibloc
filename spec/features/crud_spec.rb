require 'rails_helper'

include SessionHelpers

feature 'Wiki CRUD check' do

  scenario 'Update' do
    sign_in
    click_link 'New Wiki'
    fill_in 'Title', with: 'This is my Title'
    fill_in 'Body', with: 'This is the body of my wiki. wahoo!'
    click_button 'Save'
    expect(page).to have_content('Post was saved')
  end

  scenario 'Update' do
    sign_in
    click_link 'All Wikis'
    click_link 'This is my Title'
    click_link 'Edit'
    fill_in 'Title', with: 'Blah blah blah'
    fill_in 'Body', with: 'LALALALALALALALALALALALAL!'
    click_button 'Save'
    expect(page).to have_content('Wiki was updated')
  end
end
