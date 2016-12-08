class User < ActiveRecord::Base
	has_many :admins
	has_many :clients
	has_many :sellers
	validates :name, presence: true, length: {minimum: 6}
	validates :password, confirmation: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
end
