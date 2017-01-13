class AddStockToBooksAndProducts < ActiveRecord::Migration
  def change
      add_column :products,:stock,:integer, default: 0
      add_column :books,:stock,:integer, default: 0
  end
end
