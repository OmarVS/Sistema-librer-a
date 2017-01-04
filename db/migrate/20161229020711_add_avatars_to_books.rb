class AddAvatarsToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :avatar
    end
    change_table :products do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :books, :avatar
    drop_attached_file :products, :avatar
  
  end
end
