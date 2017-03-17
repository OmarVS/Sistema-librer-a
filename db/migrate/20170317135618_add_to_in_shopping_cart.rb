class AddToInShoppingCart < ActiveRecord::Migration
  def change
    add_column :in_shopping_carts, :product_barcode, :bigint
  end
end
