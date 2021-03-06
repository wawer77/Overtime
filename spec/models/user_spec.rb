require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.create(:user)
    end
  
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end
  
  describe 'validations' do
    
    it "cannot be created without first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      end      
    
    it "cannot be created without last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end  
   
    it "cannot be created without phone nb" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
    
    it "requires phone nb to only contain integers" do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end      
   
    it "requires phone nb to contain 9 chars" do
      @user.phone = '1234567891'
      expect(@user).to_not be_valid
    end          
    
  end
  
  
  
  
  describe "custom name methods" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("Snow Jon")
    end
  end
end
