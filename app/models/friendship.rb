class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  before_save :default_values
  
  validates_uniqueness_of [:user_id, :friend_id]
  # validates_uniqueness_of :user_id, :scope => [:friend_id,]

  def default_values
    self.status ||= "request"
  end
end
