# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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



