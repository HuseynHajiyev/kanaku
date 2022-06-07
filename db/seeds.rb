# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


city= City.create!(name: "bangladesh", description: "beautiful_city", latitude: 23.6850, longitude: 90.3563)
Venue.create!(address: "cat", description: "car", rating: 1, name: "hello", latitude:23.6850, longitude:90.3563, city: city)
