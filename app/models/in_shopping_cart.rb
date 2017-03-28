# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  book_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InShoppingCart < ActiveRecord::Base
  belongs_to :shopping_cart
  belongs_to :user

  def product
    product=Product.find_by_barcode(self.product_barcode)
      if product.nil?
        product=Book.find_by_barcode(self.product_barcode)
      end
    product
  end

end
