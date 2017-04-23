class User < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_one :profile # trying to fix db migration issue
  has_secure_password
end
