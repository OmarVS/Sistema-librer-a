class AddAdmin < ActiveRecord::Migration
  def self.up
    user = User.create!( :name => 'admin1', :password => '123123', :email => 'brauliopuentes1995@hotmail.es', :password_confirmation => '123123' )
  end

end
