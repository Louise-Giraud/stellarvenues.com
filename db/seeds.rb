# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
Venue.destroy_all
User.destroy_all
user = User.create(email: "user2445@gmail.com", password: "123456", username: "amazing_user")

puts 'Creating 10 fake venues...'

10.times do
  venue = Venue.new(
    name:    Faker::Space.galaxy,
    address: Faker::Address.full_address,
    capacity:  rand(20..1500),
    user: user
  )
  venue.save!
end
puts 'Finished!'
