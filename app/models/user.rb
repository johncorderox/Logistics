class User < ActiveRecord::Base
  has_secure_password

  belongs_to :address

  has_many :deliveries
  has_many :auctions
  has_many :bids

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  before_create :user_level

  after_create :successfully_created

  #this callback will give the user a level of 1 when created.
  private
    def user_level
      self.level = 0
    end
    def successfully_created
      puts "User ID: #{self.id} created with level: #{self.level}"
    end
end
