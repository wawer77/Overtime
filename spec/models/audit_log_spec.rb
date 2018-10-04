require 'rails_helper'

RSpec.describe AuditLog, type: :model do

  
  describe 'creation' do
    before do
      @user = FactoryBot.create(:user)
      @audit_log = FactoryBot.create(:audit_log, user_id: @user.id)
    end
    
    it 'can be created' do
        expect(@audit_log).to be_valid
    end
  end
  
  describe 'validations' do
      before do
        @user = FactoryBot.create(:user)
        @audit_log = FactoryBot.create(:audit_log, user_id: @user.id)
      end

      it 'should be required to have user association' do
        @audit_log.user_id = nil  
        expect(@audit_log).to_not be_valid
      end
  
      it 'should alwyas have a status' do
        @audit_log.status = nil    
        expect(@audit_log).to_not be_valid
      end
  
      it 'should be required to have a start_date' do
        @audit_log.start_date= nil    
        expect(@audit_log).to_not be_valid
      end    
    
      it 'should have start date equal to 6days prior' do
        new_audit_log = FactoryBot.create(:audit_log, user_id: @user.id)
        expect(new_audit_log.start_date).to eq(Date.today - 6.days)
      end    
  end
end
