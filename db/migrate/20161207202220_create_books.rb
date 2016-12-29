class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :price
      t.string :writer
      t.string :editorial

      t.timestamps null: false
    end
  end
end
