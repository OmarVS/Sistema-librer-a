class AddAdmin < ActiveRecord::Migration
  def self.up
    user = User.create!( :name => 'admin1', :password => '123123' )
  end

end
