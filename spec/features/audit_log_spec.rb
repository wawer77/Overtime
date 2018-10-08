require 'rails_helper'

describe 'AuditLog Feaure' do
  let!(:audit_log) { FactoryBot.create(:audit_log) }
  describe 'index' do
    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, :scope => :user)
    end
    
    it 'has index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end
    
    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/Snow Jon/)
    end
    
    it 'cannot be accessed by non-admin' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
