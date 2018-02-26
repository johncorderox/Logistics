class Delivery < ActiveRecord::Base
  belongs_to :users
  belongs_to :address
  belongs_to :auction
end
