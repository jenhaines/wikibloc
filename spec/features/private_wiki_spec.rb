require 'rails_helper'

include SessionHelpers

feature 'Create Private Wiki' do

  before do
    @user = create(:user)
    @wiki = create(:wiki)
  end

  scenario 'User Role is Standard' do
    sign_in_with @user, 'standard'
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
require 'rails_helper'

describe User do
  ...
   describe ".top_rated" do
 
     before do
       @user1 = create(:user)
       post = create(:post, user: @user1)
       create(:comment, user: @user1, post: post)
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
end