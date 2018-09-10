require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
    @user = FactoryBot.create(:user)
  end
  
  describe 'edit' do
    before do
      @post = FactoryBot.create(:post, user_id: @user.id)
      visit edit_post_path(@post)
    end
   
    it 'has a status that can be edited on the form by admin' do
      choose('post_status_approved')
      click_on "Save"
      #reload to reload the variable after a change
      expect(@post.reload.status).to eq('approved')
    end
  
    
    it 'cannot be edited by a non-admin' do
      logout(:admin_user)
      login_as(@user, :scope => :user)
      
      visit edit_post_path(@post)
      expect(page).to_not have_content("Approved")
    end 
    
    it 'cannot be edited by creator after approval' do
      logout(:admin_user)
      login_as(@user, :scope => :user)
      
      @post.update(status:'approved')
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    
    end
  end
end