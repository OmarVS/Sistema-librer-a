class AddUserIdToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :user, index: true, foreign_key: true
  end
end
