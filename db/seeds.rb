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
user1 = User.create(email: "user2446@gmail.com", password: "123456", username: "kat_user")
user2 = User.create(email: "user2447@gmail.com", password: "123456", username: "louise_user")


puts 'Creating 10 fake venues...'

10.times do
  venue = Venue.new(
    name:    Faker::Space.galaxy,
    address: Faker::Address.full_address,
    capacity:  rand(20..1500),
    user: user,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  )
  venue.save!
end
puts 'Finished!'
