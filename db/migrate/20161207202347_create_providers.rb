class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :rut
      t.string :business

      t.timestamps null: false
    end
  end
end
