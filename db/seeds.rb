# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#<User id: 1, email: "cc0-11@outlook.de", created_at: "2019-07-09 10:08:52", updated_at: "2019-07-09 10:08:52", admin: nil>
puts "!delete all bookings/spaces/users manually, if you've already used seeds before!"
puts " creating user1, email test@outlook.de, password: test123"
user1 = User.create!(email: "test@outlook.de", password: "test123")
puts "created user1!"

puts " create 3 spaces uploaded by this user1"
space1 = Space.new(
  address: "Alexanderplatz 1, Berlin",
  start_date: Date.parse('2019-07-22'),
  end_date: Date.parse('2019-07-30'),
  price: 10,
  size: "4",
  photo: "image/upload/v1562691769/igq4k8jzbr4ftdiuphty.jpg")
space1.user = user1
space1.save!
puts "saved first space for user1"

space2 = Space.new(
  address: "Kochstraße 4, Berin",
  start_date: Date.parse('2019-08-01'),
  end_date: Date.parse('2019-08-09'),
  price: 12,
  size: "6",
  photo: "image/upload/v1562691899/wmp0wtaimkorp1megjdc.jpg"
)
space2.user = user1
space2.save!
puts "saved second space for user1"

space3 = Space.new(
  address: "Brandenburger Tor 20, Berlin",
  start_date: Date.parse('2019-07-14'),
  end_date: Date.parse('2019-07-29'),
  price: 15,
  size: "3",
  photo: "image/upload/v1562692036/ul9bpwgywputgwtqvhj8.jpg"
)
space3.user = user1
space3.save!
puts "saved third space for user1"

puts " creating user2, email test2@outlook.de, password: test222"
user2 = User.create!(email: "test2@outlook.de", password: "test222")
puts "created user2!"

puts "create 1 space uploaded by this user2"
space4 = Space.new(
  address: "Alexa 5, Berlin",
  start_date: Date.parse('2019-08-22'),
  end_date: Date.parse('2019-08-30'),
  price: 20,
  size: "5",
  photo: "image/upload/v1562749973/okzidmjbpmj7k48uajhy.jpg")
space4.user = user2
space4.save!
puts "saved space for user2"

puts " Booking1: User2 books space1 from user1"
booking1 = Booking.new(
  start_date: Date.parse('2019-07-25'),
  end_date: Date.parse('2019-07-28'),
  cost: 30, status: "pending")
booking1.space = space1
booking1.user = user2
booking1.save!
puts "Booked1!"

puts " Booking2: User2 books space3 from user1"
booking2 = Booking.new(
  start_date: Date.parse('2019-07-15'),
  end_date: Date.parse('2019-07-20'),
  cost: 30, status: "pending")
booking2.space = space3
booking2.user = user2
booking2.save!
puts "Booked2!"
