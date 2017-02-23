# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  password   :string
#  phone      :integer
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind       :string(30)
#

class User < ActiveRecord::Base
	before_save { |user| user.email = email.downcase}
	before_save :create_remember_token
	has_secure_password
	belongs_to :admins
	belongs_to :clients
	belongs_to :sellers
	validates_uniqueness_of :name
    validates_confirmation_of :password, :on => :create
    validates_length_of :password, :within => 6..40
	validates :name, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
	validate :user_not_registered
	validates :email, presence: true, format: {with: /.+@.+\..+/i}, uniqueness: {case_sensitive: false}

	private

		def user_not_registered
			errors.add :email, 'ya está registrado' if User.find_by_email(email)
		end

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
