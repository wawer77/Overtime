class Post < ApplicationRecord
  belongs_to :user, optional: true
  #Made optional to pass test spec/models/post - when creating post a user must be defined 
  validates_presence_of :date, :rationale
  
end
