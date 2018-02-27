class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :price, presence: true, numericality: true
end
