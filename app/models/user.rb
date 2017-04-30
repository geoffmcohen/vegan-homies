class User < ApplicationRecord	
	validates :name, presence: true, uniqueness: true
	has_one :profile
  has_secure_password
end
