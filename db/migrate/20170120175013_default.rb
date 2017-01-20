class Default < ActiveRecord::Migration
  def self.up
    change_column :users, :kind, :string, default: "Cliente"
  end
end
