# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "--Destroy current data--"
  Booking.destroy_all
  Offer.destroy_all
  User.destroy_all
puts "--End of destroying current data--"

puts "---Creating users"

  raph = User.new(email: "raphael.mosca@gmail.com", password: "123456", first_name: "Raphael", last_name: "Mosca", address:"rue batman 40000 angers", nationality: "French")
  raph.save!
  puts "Creating raph"

  olivia = User.new(email: "olivia.bihl@gmail.com", password: "123456", first_name: "Olivia", last_name: "Bihl", address:"Montreuil paris", nationality: "French")
  olivia.save!
  puts "Olivia created"

  amelien = User.new(email: "amelien.delahaie@gmail.com", password: "123456", first_name: "Amelien", last_name: "Delahaie", address:"Levallois", nationality: "French")
  amelien.save!
  puts "Amélien created"

  charlie = User.new(email: "charlie.bertrand@live.com", password:"123456", first_name: "Charlie", last_name: "Bertrand", address: "79 boulevard Vincent Auriol 75013 Paris", nationality: "French")
  charlie.save!

puts "End of user creation"


puts "---starting seeding offers---"

  offer1 = Offer.new(user: raph, :address => '159 boulevard Jean Jaurès Clichy', :area => 5, :price_per_hour => 7, :title => "Câlins", :description => "Pas le moral ce matin ? Je passe vous faire un câlin et je vous apporte le café ", :photos => "https://source.unsplash.com/1600x900/?coffee,happiness")
  offer1.save!
  puts "Creating offer 1"

  offer2 = Offer.new(user: olivia , :address => '159 rue Anatole France Levallois', :area => 3, :price_per_hour => 15, :title => "Cookies et écoute", :description => "Je propose de vous ramener des cookies et d'écouter vos problèmes", :photos => "https://source.unsplash.com/1600x900/?joy,food")
  offer2.save!
  puts "Creating offer 2"

  offer3 = Offer.new(user: amelien, :address => '10 rue Lavoisier 75008 Paris', :area => 2, :price_per_hour => 5, :title => "Présence", :description => "Vous ne voulez pas être seul ? Je viens et je vous tiens compagnie.", :photos => "https://source.unsplash.com/1600x900/?lonely,warm")
  offer3.save!
  puts "Creating offer 3"

  offer4 = Offer.new(user: charlie, :address => '10 rue Daru 75008 Paris', :area => 10, :price_per_hour => 12, :title => "Buvons un verre", :description => "Dure journée, hein ? Je suis là pour vous écouter autour d'un verre", :photos => "https://source.unsplash.com/1600x900/?wine,date")
  offer4.save!
  puts "Creating offer 4"

  offer5 = Offer.new(user: charlie, :address => '13 rue Guillaume Tell 75017 Paris', :area => 1, :price_per_hour => 11, :title => "Dispo par téléphone", :description => "Vous pouvez m'appeler pour vous énerver si vous en avez besoin", :photos => "https://source.unsplash.com/1600x900/?phone,angry")
  offer5.save!
  puts "Creating offer 5"

  offer6 = Offer.new(user: charlie, :address => '99 rue de la Faisanderie 75016 Paris', :area => 7, :price_per_hour => 8, :title => "Parlons :) !", :description => "Hey ! On peut se retrouver et discuter ! J'aime les chats et les animaux en général", :photos => "https://source.unsplash.com/1600x900/?discuss,sofa")
  offer6.save!
  puts "Creating offer 6"

  offer7 = Offer.new(user: amelien, address: "14 rue de Amiral Mouchez 75014 Paris", area: "10", price_per_hour: 10, title: "Je vous rends visite et vous fait rigoler", description: "Je suis un humoriste à la base. J'ai travaillé avec des grands nom comme Dieud...Elie Semoune et plein d'autres!", photos: "https://source.unsplash.com/1600x900/?humor,%20laught" )
  offer7.save!
  puts "Creating offer 7"

  offer8 = Offer.new(user: raph, address: "16 place du General de Gaulle Montreuil", area: "20", price_per_hour: 10, title: "Hello hello, par ici !", description: "Si vous souhaitez passer une bonne journée, n'hésitez pas à me demander! Je suis impatient de vous rencontrer", photos: "https://source.unsplash.com/1600x900/?smile,smile" )
  offer8.save!
  puts "Creating offer 8"


puts "---end of seeding offers"


puts "-- creating bookings"

puts "--booking for Olivia---"
Booking.create(user: raph, offer: offer2, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: charlie, offer: offer2, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")

puts "--booking for raph"
Booking.create(user: olivia, offer: offer1, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: charlie, offer: offer1, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")

puts "--booking for charlie--"
Booking.create(user: raph, offer: offer6, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: olivia, offer: offer6, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: amelien, offer: offer5, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")

puts "--booking for amelien--"
Booking.create(user: olivia, offer: offer3, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: charlie, offer: offer7, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")
Booking.create(user: raph, offer: offer3, date_begin: Time.current, date_end: Time.current + 1.hour, status: "En attente")

puts "---end seeding---"

