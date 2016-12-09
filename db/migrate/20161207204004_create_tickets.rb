class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
