class User < ApplicationRecord	
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	has_one :profile
  has_secure_password
end
