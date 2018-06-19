# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Creature.destroy_all
User.destroy_all
Booking.destroy_all

puts 'Setting users variable'
USERS = [
  {email: "user01@test.com", password: "password01", password_confirmation: "password01"},
  {email: "user02@test.com", password: "password02", password_confirmation: "password02"},
  {email: "user03@test.com", password: "password03", password_confirmation: "password03"},
  {email: "user04@test.com", password: "password04", password_confirmation: "password04"},
  {email: "user05@test.com", password: "password05", password_confirmation: "password05"}
]

puts 'Creating users'
users = User.create!(USERS)

puts 'Setting creatures variable'
CREATURES = [
  {user_id: User.where("email = ?", "user01@test.com")[0][:id], name: "Creature01", address: Faker::Address.full_address, picture: "picture01", price: "100", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user01@test.com")[0][:id], name: "Creature02", address: Faker::Address.full_address, picture: "picture02", price: "200", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user01@test.com")[0][:id], name: "Creature03", address: Faker::Address.full_address, picture: "picture03", price: "300", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user02@test.com")[0][:id], name: "Creature04", address: Faker::Address.full_address, picture: "picture04", price: "400", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user02@test.com")[0][:id], name: "Creature05", address: Faker::Address.full_address, picture: "picture05", price: "500", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user02@test.com")[0][:id], name: "Creature06", address: Faker::Address.full_address, picture: "picture06", price: "600", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user03@test.com")[0][:id], name: "Creature07", address: Faker::Address.full_address, picture: "picture07", price: "700", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user03@test.com")[0][:id], name: "Creature08", address: Faker::Address.full_address, picture: "picture08", price: "800", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user04@test.com")[0][:id], name: "Creature09", address: Faker::Address.full_address, picture: "picture09", price: "900", description: "Lorem ipsum dolores"},
  {user_id: User.where("email = ?", "user04@test.com")[0][:id], name: "Creature10", address: Faker::Address.full_address, picture: "picture10", price: "1000", description: "Lorem ipsum dolores"}
]

puts 'Creating creatures'
creatures = Creature.create!(CREATURES)

puts 'Setting bookings variable'
BOOKINGS = [
  {user_id: User.where("email = ?", "user01@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature01")[0][:id], start_date: Date.new(2019, 1, 1), end_date: Date.new(2019, 2, 1)},
  {user_id: User.where("email = ?", "user02@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature02")[0][:id], start_date: Date.new(2019, 2, 1), end_date: Date.new(2019, 3, 1)},
  {user_id: User.where("email = ?", "user03@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature03")[0][:id], start_date: Date.new(2019, 3, 1), end_date: Date.new(2019, 4, 1)},
  {user_id: User.where("email = ?", "user04@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature04")[0][:id], start_date: Date.new(2019, 4, 1), end_date: Date.new(2019, 5, 1)},
  {user_id: User.where("email = ?", "user05@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature05")[0][:id], start_date: Date.new(2019, 5, 1), end_date: Date.new(2019, 6, 1)},
  {user_id: User.where("email = ?", "user01@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature06")[0][:id], start_date: Date.new(2019, 6, 1), end_date: Date.new(2019, 7, 1)},
  {user_id: User.where("email = ?", "user02@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature07")[0][:id], start_date: Date.new(2019, 7, 1), end_date: Date.new(2019, 8, 1)},
  {user_id: User.where("email = ?", "user03@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature08")[0][:id], start_date: Date.new(2019, 8, 1), end_date: Date.new(2019, 9, 1)},
  {user_id: User.where("email = ?", "user04@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature09")[0][:id], start_date: Date.new(2019, 9, 1), end_date: Date.new(2019, 10, 1)},
  {user_id: User.where("email = ?", "user05@test.com")[0][:id], creature_id: Creature.where("name = ?", "Creature10")[0][:id], start_date: Date.new(2019, 10, 1), end_date: Date.new(2019, 11, 1)}
]

puts 'Creating bookings'
Booking.create!(BOOKINGS)

puts 'Finished!'

