# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.create!([{name: "Fantasía"},{name: "Ciencia Ficción"},{name: "Romance"},{name: "Aventura"},{name: "Comedia"},{name: "Drama"}])
User.create!( :name => 'admin1', :password => '123123', :email => 'brauliopuentes1995@hotmail.es', :password_confirmation => '123123' )
