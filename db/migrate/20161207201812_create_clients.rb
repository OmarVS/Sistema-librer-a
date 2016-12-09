class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :RUT

      t.timestamps null: false
    end
  end
end
