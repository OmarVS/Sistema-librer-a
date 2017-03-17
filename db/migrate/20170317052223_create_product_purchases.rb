class CreateProductPurchases < ActiveRecord::Migration
  def change
    create_table :product_purchases do |t|
      t.references :purchase, index: true, foreign_key: true
      t.bigint :product_barcode
      t.integer :amount
      t.integer :price

      t.timestamps null: false
    end
  end
end
