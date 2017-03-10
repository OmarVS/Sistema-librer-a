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
	attr_readonly :barcode, :on => :update
	validates_uniqueness_of :barcode, :message => 'Ya está registrado'
	validates :barcode, presence: true, length: {in: 10..15}
	validate :barcode_positivo
	validates :name, presence: true, length: {in: 4..50}
	validates :price, presence: true, length: {maximum: 7}
	validates :writer, presence: true, length: {in: 6..30}
	validates :editorial, presence: true, length: {in: 4..30}
	validates :genre_id, presence: true
	# validate :book_not_registered

	has_attached_file :avatar, :styles => { :medium => "300x500#", :thumb => "150x250#" }, :default_url => "/images/books/:style/missing.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

def book_not_registered
	errors.add :name, 'ya está registrado' if Book.find_by_name(name)
end

def barcode_positivo
	errors.add :barcode, 'Ingrese sólo números' if self.barcode.include?("-")
end
