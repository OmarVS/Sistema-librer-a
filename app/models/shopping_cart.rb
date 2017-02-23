class ShoppingCart < ActiveRecord::Base
	has_many :products,  through: :in_shopping_carts
	has_many :in_shopping_carts
	has_many :books, through: :in_shopping_carts

	enum status: {payed: 1, default: 0}

	def total
		suma = 0
		products.each do |product|
			suma += product.price
		end
		suma
	end
end