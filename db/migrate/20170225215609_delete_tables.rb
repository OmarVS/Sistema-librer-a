class DeleteTables < ActiveRecord::Migration
  def change
  	drop_table :admins
  	drop_table :clients
  	drop_table :sellers
  end
end
