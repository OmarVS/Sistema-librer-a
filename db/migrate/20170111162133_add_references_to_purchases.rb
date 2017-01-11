class AddReferencesToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :book, index: true, foreign_key: true
    add_reference :purchases, :provider, index: true, foreign_key: true
  end
end
