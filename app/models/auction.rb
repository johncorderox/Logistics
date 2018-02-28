class Auction < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  has_one :delivery
  has_many :bids

  validates :title, :description, presence: true, length: { minimum: 2}
  validates :minimum_price, numericality: {greater_than_or_equal_to: 1}, presence: true

  before_save :add_default_status
  before_save :add_default_auction_end

  private
   def add_default_status
     self.status = "New"
   end
   def add_default_auction_end
     self.auction_end = Time.now
   end
end
