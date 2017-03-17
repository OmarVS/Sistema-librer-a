class ChangeTypeProductBarcode < ActiveRecord::Migration
  def up
    change_table :product_sales do |t|
      t.change :product_barcode, :bigint
    end
  end

  def down
    change_table :product_sales do |t|
      t.change :product_barcode, :integer
    end
  end
end
