class AddBarcodeToBooksAndProducts < ActiveRecord::Migration
  def change
    add_column :products,:barcode,:integer
    add_column :books,:barcode,:integer
  end
end
