require 'rails_helper'

include SessionHelpers

feature 'Create Private Wiki' do

  before do
    @user = create(:user, role: 'premium')
    @user2 = create(:user)
    @wiki = create(:wiki, user: @user)
    @wiki2 = create(:wiki, title: 'another Wiki', user: @user2)
  end

  scenario 'Premium user can make private Wikis' do
    sign_in @user
    click_link 'Wiki Title'
    click_link 'Edit'
    check 'wiki_hide'
    click_button 'Save'
    expect(page).to have_content('Wiki was updated')
  end

  scenario 'Standard user cannot make private Wikis' do
    sign_in @user2
    click_link 'another Wiki'
    click_link 'Edit'
    expect(page).to have_no_content('private')
  end

end
