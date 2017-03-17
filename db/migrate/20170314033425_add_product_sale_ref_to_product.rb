class AddProductSaleRefToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :product_sale, index: true, foreign_key: true
  end
end
