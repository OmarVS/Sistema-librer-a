class User < ActiveRecord::Base
	has_many :admins
	has_many :clients
	has_many :sellers
	validates_uniqueness_of :name 
    validates_confirmation_of :password, :on => :create
    validates_length_of :password, :within => 5..40 
	validates :name, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
	validates :email, presence: true
	validate :user_not_registered
	validates :email, format: {with: /.+@.+\..+/i}
end

private

def user_not_registered
	errors.add :email, 'ya está registrado' if User.find_by_email(email)
end