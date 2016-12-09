class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.integer :RUT

      t.timestamps null: false
    end
  end
end
