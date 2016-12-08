class User < ActiveRecord::Base
	has_many :admins
	has_many :clients
	has_many :sellers
	validates :name, presence: true, length: {minimum: 6}
	validates :password, confirmation: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
	validates :email, presence: true
	validate :user_not_registered
	validates :email, format: {with: /.+@.+\..+/i}
end

private

def user_not_registered
	errors.add :email, 'ya está registrado' if User.find_by_email(email)
end