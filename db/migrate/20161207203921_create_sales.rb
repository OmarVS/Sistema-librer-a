class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
