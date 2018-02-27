class Address < ActiveRecord::Base
  has_many :deliveries
  has_many :auctions

  belongs_to :user

  validates :street, :city, :zip_code, presence: true
  validates :state, length: { maximum: 2 }

  before_save :upcase_state

  private
  def upcase_state
    self.state.upcase!
  end

end
