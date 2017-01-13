# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.create!([{name: "Fantasía"},
  {name: "Ciencia Ficción"},
  {name: "Romance"},
  {name: "Aventura"},
  {name: "Comedia"},
  {name: "Drama"}])
User.create!([
  { :name => 'admin1',
    :password => '123123',
    :email => 'brauliopuentes1995@hotmail.es',
    :password_confirmation => '123123',
    :kind => 'admin'},
  { :name => 'omarvs',
    :password => '123123',
    :email => 'prueba@test.cl',
    :password_confirmation => '123123',
    :kind => 'seller'},
  { :name => 'mariom',
    :password => '123123',
    :email => 'test@test.cl',
    :password_confirmation => '123123',
    :kind => 'client'} ])
Book.create!([
  { name: 'Harry Potter y la piedra filosofal',
    price: 39990,
    writer: "J.K. Rowling",
    editorial: "Salamandra",
    genre_id: 1,stock: 0,barcode: 001},
  { name: 'Harry Potter y la cámara secreta',
    price: 39990,
    writer: "J.K. Rowling",
    editorial: "Salamandra",
    genre_id: 1,stock: 0,barcode: 002},
  { name: 'Papelucho en la clínica',
    price: 9990,
    writer: "Marcela Paz",
    editorial: "El barco de vapor",
    genre_id: 4,stock: 0,barcode: 003} ])
Product.create!(
 {name: "Block Medio",
  price: 1190,
  trademark: "Artel",
  stock: 0,
  barcode: 004})
Provider.create!(
  {name: "asdasd",
   rut: 123,
   business: "asdasd"} )
