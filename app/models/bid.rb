class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :price, presence: true, numericality: true

  before_create :check_bid

  private
    def check_bid
    end
end
