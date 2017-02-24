class AddProductReferenceForPurchases < ActiveRecord::Migration
  def change
  	add_reference :purchases, :product, index: true, foreign_key: true
  end
end
