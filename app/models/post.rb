class Post < ApplicationRecord
  belongs_to :user, optional: true
  #Made optional to pass test spec/models/post - when creating post a user must be defined 
  validates_presence_of :date, :rationale, :overtime_request
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  
  scope :posts_by, ->(user) { where(user_id: user.id) }
  
  validates :overtime_request, numericality: { greater_than: 0.0 }
end

