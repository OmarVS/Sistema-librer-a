class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.integer :amount
      t.integer :price

      t.timestamps null: false
    end
  end
end
