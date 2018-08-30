require 'rails_helper'

describe "navigate" do
  
  describe "index" do
    
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    
    it "has a title of Posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
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
  end
    
end
