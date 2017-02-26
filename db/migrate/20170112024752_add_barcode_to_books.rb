class AddBarcodeToBooks < ActiveRecord::Migration
  def change
    add_column :books, :barcode, :integer
    add_index :books, :barcode, unique: true
    add_column :products, :barcode, :integer
    add_index :products, :barcode, unique: true
  end
end
