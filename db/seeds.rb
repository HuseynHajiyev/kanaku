require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

city_country = ["Britain", "America", "France", "Turkey", "Germany", "Russia", "Netherlands"]
city_names = ["London", "New York", "Paris", "Istanbul", "Berlin", "Saint Petersburg", "Amsterdam"]
city_description = ["The man who can dominate a London dinner-table can dominate the world.",
                    "The city that never sleeps!",
                    "To know Paris is to know a great deal.",
                    "Istanbul is inspiring because it has its own code of architecture, literature, poetry, music.",
                    "Berlin, the greatest cultural extravaganza that one could imagine.",
                    "St. Petersburg is a gem of world culture and Russia's most European city.",
                    "In Europe, I always have fun bike riding in Amsterdam."]
city_latitude = [51.5072, 40.7128, 48.8566, 41.0082, 52.5200, 59.9311, 52.3676]
city_longitude = [0.1276, 74.0060, 2.3522, 28.9784, 13.4050, 30.3609, 4.9041]

city_names.each_with_index do |city, index|
  city = City.new(name: city)
  city.country = city_country[index]
  city.description = city_description[index]
  city.latitude = city_latitude[index]
  city.longitude = city_longitude[index]
  city.save
end

City.all.each do |city|
  15.times do
    venue = Venue.new
    venue.name = Faker::Restaurant.name
    venue.description = Faker::Restaurant.description
    venue.rating = rating.rand(0..5)
    venue.latitude = city.latitude
    venue.longitude = city.longitude
    venue.address = Faker::Address.street_address
    venue.city = city
    venue.save
  end
end
