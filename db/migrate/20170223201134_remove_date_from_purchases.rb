class RemoveDateFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :date, :date
  end
end
