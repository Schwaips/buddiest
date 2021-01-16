# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "---creating users"

  raph = User.new(email: "raphael.mosca@gmail.com", password: "123456", first_name: "Raphael", last_name: "Mosca", address:"rue batman 40000 angers", nationality: "French")
  raph.save!
  puts "Creating raph"

  olivia = User.new(email: "olivia.bihl@gmail.com", password: "123456", first_name: "Olivia", last_name: "Bihl", address:"Montreuil paris", nationality: "French")
  olivia.save!
  puts "Olivia created"

  amelien = User.new(email: "amelien.delahaie@gmail.com", password: "123456", first_name: "Amelien", last_name: "Delahaie", address:"Levallois", nationality: "French")
  amelien.save!
  puts "Amélien created"

puts "end of user creation"


puts "---starting seeding offers---"
10.times do
 user = User.all.sample
 user_id = User.all.sample.id
 price = [25, 46, 100, 10].sample
 area = [5, 10, 15, 20, 100].sample
  offer = Offer.new(title: Faker::Educator.course_name, description: Faker::Educator.subject, price_per_hour: price, area: area, user_id: user_id, address: Faker::Address.street_address)
  offer.save!
  puts "saving #{offer.title}"
end
puts "---end of seeding offers"

