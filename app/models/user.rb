class User < ApplicationRecord	
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates_format_of :name, :with => /\A[a-zA-Z]\w*\z/, :message => 'must start with a letter and can only contain letters, numbers and underscores (i.e. username, username1, user_name_1)' 
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => 'must be a valid email address in the form of xxx@yyy.zzz'
	has_one :profile
  has_secure_password
  before_create :convert_name_and_email_to_lowercase
  
  private 
  	def convert_name_and_email_to_lowercase
  		self.email.downcase!
  		self.name.downcase!
  	end
end
