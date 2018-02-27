class Auction < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  has_one :delivery
  has_many :bids

  validates :title, :description, presence: true, length: { minimum: 2}
  validates :minimum_price, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :auction_end, presence: true
end
