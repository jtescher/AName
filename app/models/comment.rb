class Comment < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :user

  validates_presence_of :body
end
