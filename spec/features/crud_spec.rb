require 'rails_helper'

include SessionHelpers

feature 'Wiki CRUD check' do

  before() do
    @thing = Thing.new
  end

  scenario 'Create' do
    user
    sign_up_with
    click_link 'New Wiki'
    fill_in 'Title', with: 'This is my Title'
    fill_in 'Body', with: 'This is the body of my wiki. wahoo!'
    click_button 'Save'
    expect(page).to have_content('Post was saved')
  end

  scenario 'Update' do
    sign_in
    click_link 'Wiki Title'
    click_link 'Edit'
    fill_in 'Title', with: 'Blah blah blah'
    fill_in 'Body', with: 'LALALALALALALALALALALALAL!'
    click_button 'Save'
    expect(page).to have_content('Wiki was updated')
  end

  scenario 'Delete' do
    sign_in
    click_link 'Wiki Title'
    click_link 'Delete Wiki'
    expect(page).to have_content('deleted successfully')
  end
end
