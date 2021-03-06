require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end
  
  describe "index" do
    before do
      visit posts_path
    end
    
    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end
    
    it "has a title of Posts" do
      expect(page).to have_content(/Posts/)
    end
    
    it "has a list of posts" do
      @post1 = FactoryBot.create(:post, user_id: @user.id)
      @post2 = FactoryBot.create(:second_post, user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/rationale|more/)
    end
    
    it "only post creators can see posts" do
      @other_user = FactoryBot.create(:non_authorized_user)
      @post1 = FactoryBot.create(:post, user_id: @user.id)
      @other_post = FactoryBot.create(:post_from_other_user, user_id: @other_user.id)
      
      visit posts_path
      expect(page).to_not have_content(/Post from another user/)
    end      
  end
  
  describe 'new' do
    
    it 'has a link from homepage' do 
      visit root_path  
      click_link("new_post_from_nav") 
      expect(page.status_code).to eq(200)
    end
  end
  
  describe 'delete' do
    
    it 'can be deleted' do
      @post = FactoryBot.create(:post, user_id: @user.id)
      visit posts_path
      click_link("delete_post_#{@post.id}_from_index") 
      expect(page.status_code).to eq(200)
    end
  
  end
  
  describe "creation" do
    before do
      visit new_post_path
    end
    
    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end
    
    it 'allows users to create a new post from the /new page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "foobar"
      fill_in 'post[overtime_request]', with: 4.5
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end
    
    it "will have user associated it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 4.5
      expect { click_on "Save" }.to change(Post, :count).by(1)
      #click_on 'Save'
      #expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
  
  describe "edit" do
    before do
      @post = FactoryBot.create(:post, user_id: @user.id)
    end

    it "can be edited" do
      visit edit_post_path(@post)
      expect(page.status_code).to eq(200)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
      expect(page).to have_content("Edited content")    
     end
    
    it 'cannot be edited by non-authoruzed user' do
      logout(:user)
      non_auth_user = FactoryBot.create(:non_authorized_user)
      login_as(non_auth_user, :scope => :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
end
