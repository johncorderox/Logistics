class Delivery < ActiveRecord::Base
  belongs_to :users
  belongs_to :address
  belongs_to :auction

  validates :price, numericality: true, presence: true
end
