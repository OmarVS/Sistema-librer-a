class ChangeTypeBarcode < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.change :barcode, :string
    end
    change_table :products do |t|
      t.change :barcode, :string
    end
  end

  def down
    change_table :books do |t|
      t.change :barcode, :integer
    end
    change_table :products do |t|
      t.change :barcode, :integer
    end
  end
end
