# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# JourneyVenue.destroy_all




user = User.create!(email: 'test3@aol.com', password: '123456')
city = City.create!({name: "london", descritpion: "effiel", latitude: 2, longtitude: 5})

3.times do |idx|
  journey = Journey.create!(user: user, description: "journey description #{idx}" )
  venue = Venue.create!({ address: "hello", description: "test description #{idx}", rating: idx, name: "me", city: city, latitude: 1, longitude: 1})
  JourneyVenue.create!(journey: journey, venue: venue)
end



# Journey.create!({user: user, description: "hello"})
# city = City.create!({name: "london", descritpion: "effiel", latitude: 2, longtitude: 5})
# Venue.create!({ address: "hello", description: "bye", rating: 1, name: "me", city: city, latitude: 1, longitude: 1})
# @journey = Journey.find(1)
# @venue = Venue.find(1)
# JourneyVenue.create!({journey: @journey, venue: @venue})
# Venue.create!({ address: "hi", description: "two", rating: 2, name: "mine", city: city, latitude: 2, longitude: 2})
# @journey = Journey.find(2)
# @venue = Venue.find(2)
# JourneyVenue.create!({journey: @journey, venue: @venue})
# Venue.create!({ address: "two", description: "three", rating: 3, name: "you", city: city, latitude: 3, longitude: 3})
# @journey = Journey.find(3)
# @venue = Venue.find(3)
# JourneyVenue.create!({journey: @journey, venue: @venue})
