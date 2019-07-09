# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#<User id: 1, email: "cc0-11@outlook.de", created_at: "2019-07-09 10:08:52", updated_at: "2019-07-09 10:08:52", admin: nil>

puts "creating one user, email test@outlook.de, password: test123"
curr_user = User.create!(email: "test@outlook.de", password: "test123")
puts "created user!"

puts "create 3 spaces put by this user"
space1 = Space.new(
  address: "Alexanderplatz 1, Berlin",
  start_date: Date.parse('2019-07-22'),
  end_date: Date.parse('2019-07-30'),
  price: 10,
  size: "4",
  photo: "image/upload/v1562691769/igq4k8jzbr4ftdiuphty.jpg")
space1.user = curr_user
space1.save!
puts "saved first space"

space2 = Space.new(
  address: "Kochstraße 4, Berin",
  start_date: Date.parse('2019-08-01'),
  end_date: Date.parse('2019-08-09'),
  price: 12,
  size: "6",
  photo: "image/upload/v1562691899/wmp0wtaimkorp1megjdc.jpg"
)
space2.user = curr_user
space2.save!
puts "saved second space"

space3 = Space.new(
  address: "Brandenburger Tor 20, Berlin",
  start_date: Date.parse('2019-07-14'),
  end_date: Date.parse('2019-07-29'),
  price: 15,
  size: "3",
  photo: "image/upload/v1562692036/ul9bpwgywputgwtqvhj8.jpg"
)
space3.user = curr_user
space3.save!
puts "saved third space"

puts "finished putting the seeds"
