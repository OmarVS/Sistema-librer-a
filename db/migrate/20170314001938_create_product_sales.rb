class CreateProductSales < ActiveRecord::Migration
  def change
    create_table :product_sales do |t|
      t.references :sale, index: true, foreign_key: true
      t.integer :product_barcode
      t.integer :amount
      t.integer :price

      t.timestamps null: false
    end
  end
end
