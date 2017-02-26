# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :integer
#  writer     :string
#  editorial  :string
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
	belongs_to :genre
	has_many :purchases
	self.primary_key = 'barcode'
	attr_readonly :barcode, :on => :update
	validates_uniqueness_of :barcode
	validates :barcode, presence: true
	validates :name, presence: true, length: {maximum: 50}
	validates :price, presence: true
	validates :writer, presence: true, length: {maximum: 30}
	validates :editorial, presence: true, length: {maximum: 30}
	validates :genre_id, presence: true
	# validate :book_not_registered

	has_attached_file :avatar, :styles => { :medium => "300x500#", :thumb => "150x250#" }, :default_url => "/images/books/:style/missing.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

def book_not_registered
	errors.add :name, 'ya está registrado' if Book.find_by_name(name)
end
