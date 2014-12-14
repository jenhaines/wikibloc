require 'rails_helper'

include SessionHelpers

feature 'Add Collaborators' do
  
  before do
    @puser = create(:user, role: 'premium')
    @pwiki = create(:wiki, user: @puser)
    @suser = create(:user)
    @swiki = create(:wiki, user: @suser, title: 'Another Wiki')
  end

  scenario 'Premium user can' do
    sign_in @puser
    click_link 'Wiki Title'
    click_link 'Edit'
    click_link 'Share'
    expect(page).to have_button 'Update'
  end

  scenario 'Standard user cannot' do
    sign_in @suser
    click_link 'Another Wiki'
    click_link 'Edit'
    expect(page).to have_no_link 'Share'
  end


end
