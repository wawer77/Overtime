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
    
    xit 'cannot be accessed by non-admin' do
    end
  end
end
