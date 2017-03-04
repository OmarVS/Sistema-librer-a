class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :product_barcode
      t.integer :provider_rut
      t.integer :amount
      t.integer :price

      t.timestamps null: false
    end
  end
end
