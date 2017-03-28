# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string
#  password            :string
#  phone               :integer
#  email               :string
#  kind                :string           default("Cliente")
#  password_digest     :string
#  remember_token      :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
	before_save { |user| user.email = email.downcase}
	before_save :create_remember_token
	has_one :shopping_cart
	has_many :sales, :dependent => :destroy
	has_secure_password
	validates_uniqueness_of :name
	validates_confirmation_of :password, :on => :create
  validates :password, length: {in: 6..40}
  validates :phone, length: {in: 9..9}
	validates :name, length: {in: 6..20}
	validates :email, format: {with: /.+@.+\..+/i}, uniqueness: {case_sensitive: false}

	has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "150x150" }, :default_url => "/images/users/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
