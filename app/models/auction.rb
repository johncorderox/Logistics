class Auction < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  has_one :delivery

  validates :title, :description, presence: true, length: { minimum: 2}
  validates :minimum_price, numericality: true, presence: true
  validates :aution_end, presence: true
end
