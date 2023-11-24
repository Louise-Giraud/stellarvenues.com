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
user = User.new(email: "user2445@gmail.com", password: "123456", username: "Xenomorph")
pic = URI.open('app/assets/images/Thumb-ET.webp')
user.photo.attach(io: pic, filename: 'Thumb-ET.webp', content_type: 'image/webp')
user.save

user_booker = User.new(email: "leia@gmail.com", password: "123456", username: "Leia")
pic = URI.open('app/assets/images/leia.jpg')
user_booker.photo.attach(io: pic, filename: 'leia.jpg', content_type: 'image/jpg')
user_booker.save!

# user1 = User.create(email: "user2446@gmail.com", password: "123456", username: "kat_user")
# user2 = User.create(email: "user2447@gmail.com", password: "123456", username: "louise_user")

capacity = [100, 130, 200, 500, 1600, 4500, 3000, 30000]
galaxies = ["Andromeda", "Black Eye Galaxy", "Bode's Galaxy", "Cartwheel Galaxy", "Cigar Galaxy", "Comet Galaxy", "Cosmos Redshift", "7 Hoag's Object", "Large Magellanic", "Cloud Small Magellanic", "Cloud Mayall's Object", "Milky Way", "Pinwheel Galaxy", "Sombrero Galaxy", "Sunflower Galaxy"]

puts 'Creating 15 fake galaxies...'

15.times do
  venue = Venue.new(
    name: galaxies.sample,
    address: Faker::Address.full_address,
    capacity:  capacity.sample,
    logistic_partner: Faker::Space.company,
    access: Faker::Space.launch_vehicle,
    available_ressources: Faker::Science.element,
    user: user,
    description: "A breathtaking galaxy available for rent! Nestled in the vast cosmic expanse, this celestial retreat offers a unique blend of awe-inspiring beauty and unparalleled tranquility. With billions of stars twinkling like diamonds in the velvety embrace of the cosmic canvas, our galaxy is a sanctuary for those seeking an extraordinary escape.",
  )
  venue.save!
end
puts 'Finished!'
