class AddStockToBooksAndProducts < ActiveRecord::Migration
  def change
      add_column :products,:stock,:integer
      add_column :books,:stock,:integer
  end
end
