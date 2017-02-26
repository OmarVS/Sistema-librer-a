class AddAdmin < ActiveRecord::Migration
  def self.up
  	user = User.create!( :name => 'rootadmin', :password => '123456',:phone => 123456789, :password_confirmation => '123456', :email => "root@admin.com", :kind => "admin" )
  end
end
