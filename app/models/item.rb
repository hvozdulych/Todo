class Item < ActiveRecord::Base
  belongs_to :list
  validates :todo, presence: true
end
