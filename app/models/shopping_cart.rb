# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ShoppingCart < ActiveRecord::Base
	include AASM
	has_many :products,  through: :in_shopping_carts
	has_many :in_shopping_carts
	has_many :books, through: :in_shopping_carts
	belongs_to :users

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
		self.in_shopping_carts.map {|i_sh| i_sh.product.paypal_form}
	end


	def total_precio
		total=0
		self.in_shopping_carts.each do |i_sh|	
			total+= i_sh.product.price
		end
		total
	end
end
