class ShoppingCart < ActiveRecord::Base
	include AASM
	has_many :products,  through: :in_shopping_carts
	has_many :in_shopping_carts
	has_many :books, through: :in_shopping_carts

	aasm column: "status" do 

		state :created, initial: true
		state :payed
		state :failed

		event :pay do
			after do
			end
			transitions from: :created, to: :payed
		end
	end

	def items
		self.products.map{|product| product.paypal_form }
	end


	def total
		products.sum(:price)
	end
end