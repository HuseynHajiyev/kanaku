# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'test3@aol.com', password: '123456', first_name: "Will", last_name: "Valentine", user_name: "W")
city = City.create!({ name: "london", description: "effiel", latitude: 2, longitude: 5 })

3.times do |idx|
  journey = Journey.create!(user: user, description: "journey description #{idx}" )
  venue = Venue.create!({ address: "hello", description: "test description #{idx}", rating: idx, name: "me", city: city, latitude: 1, longitude: 1})
  JourneyVenue.create!(journey: journey, venue: venue)
end

city = City.create!(name: "bangladesh", description: "beautiful_city", latitude: 23.6850, longitude: 90.3563)
Venue.create!(address: "cat", description: "car", rating: 1, name: "hello", latitude:23.6850, longitude:90.3563, city: city)
