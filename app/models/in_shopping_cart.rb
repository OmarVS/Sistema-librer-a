class InShoppingCart < ActiveRecord::Base
  belongs_to :product
  belongs_to :book
  belongs_to :shopping_cart

  has_one :user, through: :product
  has_one :user, through: :book
end