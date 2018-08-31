require 'rails_helper'

describe "navigate" do
  before do
    user = User.create(email: "test@test.com", password: "foobar", password_confirmation: "foobar", first_name: "Jon", last_name: "Snow")
    login_as(user, :scope => :user)
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
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post2 = Post.create(date: Date.today, rationale: "Post2")
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
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
      fill_in 'post[rationale]', with: "Whatever"
      click_on "Save"
      expect(page).to have_content("Whatever")
    end
    
    it "will have user associated it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  
  end
end
