class Profile < ActiveRecord::Base
  belongs_to :user

  validates :age, :numericality => {:only_integer => true}
end
