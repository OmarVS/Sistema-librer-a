class ChangeTypeBarcode < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.change :barcode, :bigint
    end
    change_table :products do |t|
      t.change :barcode, :bigint
    end
    change_table :purchases do |t|
      t.change :product_barcode, :bigint
    end
    change_table :sales do |t|
      t.change :product_barcode, :bigint
    end
  end

  def down
    change_table :books do |t|
      t.change :barcode, :integer
    end
    change_table :products do |t|
      t.change :barcode, :integer
    end
    change_table :purchases do |t|
      t.change :product_barcode, :integer
    end
    change_table :sales do |t|
      t.change :product_barcode, :integer
    end
  end
end
