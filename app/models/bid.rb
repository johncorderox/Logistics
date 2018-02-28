class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :price, presence: true, numericality: true

  validate :bid_must_be_lower


  private
    def bid_must_be_lower
      if Bid.find_by(auction_id: self.auction.id)
        current_lowest_bid = Bid.where(auction_id: self.auction.id).last.price
      else
        current_lowest_bid = Auction.find(self.auction.id).minimum_price
      end

      if self.price >= current_lowest_bid
        errors.add(:bid_price, "cannot be higher than the current bid")
      end
    end

end
