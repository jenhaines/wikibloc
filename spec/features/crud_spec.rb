require 'rails_helper'

include SessionHelpers

feature 'User CRUD functions' do

  before do 
    @user = create(:user)
    @wiki = create(:wiki)
  end


  scenario 'Create wiki' do
    sign_in_with @user , "standard"
    click_link 'New Wiki'
    fill_in 'Title', with: 'This is my Title'
    fill_in 'Body', with: 'This is the body of my wiki. wahoo!'
    click_button 'Save'
    expect(page).to have_content('Post was saved')
  end

  scenario 'Update' do
    sign_in_with @user , "standard"
    # visit wikis_path
    click_link 'Wiki Title'
    click_link 'Edit'
    fill_in 'Title', with: 'Blah blah blah'
    fill_in 'Body', with: 'LALALALALALALALALALALALAL!'
    click_button 'Save'
    expect(page).to have_content('Wiki was updated')
  end

  scenario 'Delete' do
    sign_in_with @user, 'standard'
    # visit wikis_path
    click_link 'Wiki Title'
    click_link 'Delete Wiki'
    expect(page).to have_content('deleted successfully')
  end
end
