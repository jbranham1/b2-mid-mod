# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@park1 = Park.create(name: 'Park 1', ticket_price: 50)
@park2 = Park.create(name: 'Park 2', ticket_price: 50)
@mechanic1 = Mechanic.create(name: 'Joe Bob', years_of_experience: 10)
@mechanic2 = Mechanic.create(name: 'Kara Smith', years_of_experience: 7)

@ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 2, open: true, park_id: @park1.id)
@ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: true, park_id: @park1.id)
@ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true, park_id: @park2.id)
@ride4 = Ride.create(id: 4, name: 'The Kiss Raise', thrill_rating: 3, open: true, park_id: @park2.id)
@mechanic_ride1 = MechanicRide.create(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
@mechanic_ride2 = MechanicRide.create(mechanic_id: @mechanic1.id, ride_id: @ride2.id)
