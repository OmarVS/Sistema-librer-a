class Book < ActiveRecord::Base
	belongs_to :genre
	validates :genre, presence: true
	validate :book_not_registered
end

def book_not_registered
	errors.add :name, 'ya está registrado' if Book.find_by_name(name)
end