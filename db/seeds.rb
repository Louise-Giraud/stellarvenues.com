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

berghain_blackhole = Venue.create(name: "Berghain Blackhole", address: "Am Wriezener bhf, 10243 Berlin", capacity: 666, logistic_partner: "SpaceBVG", access: "HIGHliner", available_ressources: "Nitrous oxide", user: user, image_url: "https://cdn.mos.cms.futurecdn.net/6y6p32tRRRtjoiVbKf2HNJ-1200-80.jpg", description: "Welcome to Berghain, the mesmerizing portal to a parallel dimension. Nestled within the vibrant city of Berlin, this enigmatic venue transcends the boundaries of reality. Berghain acts as a conduit to a cosmic abyss, a gateway to a swirling black hole that defies comprehension - it beckons those seeking an otherworldly experience. Step through its mysterious doors, and you'll find yourself transported to an ethereal realm where time and space intertwine. The pulsating beats and immersive atmosphere become the gravitational force that propels you deeper into the unknown. Surrender to the gravitational pull, let the music guide your journey, and embark on an extraordinary adventure through the infinite expanse of Berghain's portal. Prepare to lose yourself in the hypnotic embrace of this cosmic anomaly, where the boundaries of existence blur and the universe unfolds its secrets.")
hammahalle_211 = Venue.create(name: "HammaHalle 211", address: "Hauptstraße 15, 10317 Berlin", capacity: 420, logistic_partner: "Berlin BlastOFF", access: "SpaceBahn21", available_ressources: "Methylenedioxyphenyl", user: user, image_url: "https://stsci-opo.org/STScI-01H9NWHWKBM3DM6PQQPZDSVY7Y.png", description: "Welcome to HammaHalle 211, the cosmic gateway to another galaxy hidden within the heart of Berlin. This extraordinary galaxy transcends the ordinary, transporting you beyond the realms of our universe. The gate at Sisyphos acts as a celestial portal, where pulsating beats and ethereal melodies guide your journey into the unknown. As you step through its enigmatic doors, prepare to embark on an intergalactic adventure. The vibrant energy and captivating atmosphere become the stardust that propels you through a cosmic wormhole, unveiling breathtaking wonders. Lost in the kaleidoscope of lights and cosmic rhythms, you'll dance amidst the swirling nebulae, surrounded by celestial beings from distant galaxies. HammaHalle 211 ignites your senses, inviting you to explore the uncharted realms of sound and embrace the infinite possibilities of the universe. Surrender to the cosmic currents, let the music guide your spacecraft, and venture into a cosmic odyssey that will leave you forever transformed.")
kitkat_246 = Venue.create(name: "KitKat 246", address: "Köpenicker Straße 76, Brückenstraße 1, 10179 Berlin", capacity: 696969, logistic_partner: "SpaceXXL", access: "XXL Starship", available_ressources: "Alkyl Nitrate", user: user, image_url: "https://cdn.spacetelescope.org/archives/images/screen/potw2020a.jpg", description: "If you're looking for privacy, KitKat 246 is the galaxy for you. Located within a cosmic void with no neighbouring galaxies, prepare to transcend the known universe. The rhythmic vibrations and hypnotic melodies become the warp drive, propelling you through a portal of infinite possibilities. Within KitKat 246's cosmic embrace, you'll encounter extraterrestrial creatures, adorned in cosmic attire, dancing to the celestial symphony. Surrender to the cosmic currents, let the pulsating beats guide your cosmic voyage, and explore the unexplored frontiers of the galaxy. KK246 weaves together cosmic artistry, boundless imagination, and uninhibited expression into an otherworldly experience that will leave you forever transformed. Embrace the cosmic dance floor, unleash your inner stardust, and embark on a celestial orgy unlike any other. PS - don't forget your swimwear! (or do 😉)")

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
