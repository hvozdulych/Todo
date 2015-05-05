class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  before_save :default_values
  
  def default_values
    self.status ||= "request"
  end
end
