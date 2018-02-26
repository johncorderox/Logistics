class User < ActiveRecord::Base
  belongs_to :address
  has_secure_password
end
