class MyPayment < ActiveRecord::Base
	belongs_to :shopping_cart
	include AASM

	aasm column: "status" do 

		state :created, initial: true
		state :payed
		state :failed

		event :pay do
			after do
				shopping_cart.pay!
			end
			transitions from: :created, to: :payed
		end
	end
end
