require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all


@city_country = ["Britain", "America", "France", "Turkey", "Germany", "Russia", "Netherlands"]
@city_names = ["London", "New York", "Paris", "Istanbul", "Berlin", "Saint Petersburg", "Amsterdam"]
@city_description = ["The man who can dominate a London dinner-table can dominate the world.",
                    "The city that never sleeps!",
                    "To know Paris is to know a great deal.",
                    "Istanbul is inspiring because it has its own code of architecture, literature, poetry, music.",
                    "Berlin, the greatest cultural extravaganza that one could imagine.",
                    "St. Petersburg is a gem of world culture and Russia's most European city.",
                    "In Europe, I always have fun bike riding in Amsterdam."]
@city_latitude = [51.509865, 40.730610, 48.864716, 41.015137, 52.520008, 59.937500, 52.377956]
@city_longitude = [-0.118092, -73.935242, 2.349014, 28.979530, 13.404954, 30.308611, 4.897070]

@city_names.each_with_index do |city, index|
  @city = City.new(name: city)
  @city.name_country = @city_country[index]
  @city.description = @city_description[index]
  @city.latitude = @city_latitude[index]
  @city.longitude = @city_longitude[index]
  @city.save!
end

@minus_plus = [1.0, -1.0]
City.all.each do |city|
  city_lat = city.latitude
  city_long = city.longitude
  15.times do
    venue = Venue.new
    venue.name = Faker::Restaurant.name
    venue.description = Faker::Restaurant.description
    venue.rating = rand(0..5)
    random_lat = rand(0..0.030000)
    random_lng = rand(0..0.030000)
    puts "city #{city.name} lat/long [#{city_lat},#{city_long}],"
    lat = (city_lat + (@minus_plus.sample * random_lat)).round(6)
    long = (city_long + (@minus_plus.sample * random_lng)).round(6)
    puts "lat/long variables [#{lat},#{long}]"
    venue.latitude = lat
    venue.longitude = long
    puts "venue lat/long saved [#{venue.latitude},#{venue.longitude}]"
    venue.address = Faker::Address.street_address
    venue.city = city
    venue.save
  end
end

# puts "Random: #{random}"
# puts "long: #{venue.latitude}"
# puts "lat: #{venue.latitude}"
# puts "Original lat: #{city.latitude}"
# puts "Original long: #{city.longitude}"
