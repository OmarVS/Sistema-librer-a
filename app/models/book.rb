class Book < ActiveRecord::Base
	belongs_to :genre
	validates :name, presence: true, length: {maximum: 50}
	validates :price, presence: true
	validates :writer, presence: true, length: {maximum: 30}
	validates :editorial, presence: true, length: {maximum: 30}
	validates :genre_id, presence: true
	# validate :book_not_registered

	has_attached_file :avatar, :styles => { :medium => "300x500#", :thumb => "75x125#" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

def book_not_registered
	errors.add :name, 'ya está registrado' if Book.find_by_name(name)
end