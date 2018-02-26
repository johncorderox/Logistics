class Auction < ActiveRecord::Base
  belongs_to :address
  belongs_to :user
  has_one :delivery
end
