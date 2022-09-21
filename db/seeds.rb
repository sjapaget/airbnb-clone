# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
bicycle_images = [
  "https://contents.mediadecathlon.com/p1863837/k$ef402fa4c1b6270d783701c05a73b863/sq/velo-vtt-electrique-e-st-100-bleu-275.jpg?format=auto&f=720x720",
  "https://contents.mediadecathlon.com/p1886648/k$8b840279e11fdb8b93578c2640d64a5a/sq/velo-de-ville-electrique-elops-120-e.jpg?format=auto&f=720x720",
  "https://contents.mediadecathlon.com/p1919293/k$9a2469637150810b66ca0ec6cba121de/sq/velo-vtt-st-120-noir-bleu-275.jpg?format=auto&f=720x720",
  "https://contents.mediadecathlon.com/p1818766/k$271b7c796874e9f6349b1fceb339a9ea/sq/velo-de-ville-elops-520-cadre-haut-kaki.jpg?format=auto&f=323x323",
  "https://contents.mediadecathlon.com/p2128228/k$9dbb3e22b078edd7e094bb98a68bc497/sq/velo-pliant-tilt-500-bleu.jpg?format=auto&f=323x323",
  "https://contents.mediadecathlon.com/p2278246/k$7f97f4af5540b1e581c025f756a5d5a9/sq/draisienne-enfant-12-pouces-runride-900-bleu.jpg?format=auto&f=323x323",
  "https://omniumcargo.dk/wp-content/uploads/2022/05/Omnium-E_Cargo_V3-grey_bg-web.jpg",
  "https://omniumcargo.dk/wp-content/uploads/2022/06/Omnium-Mini_V3-grey_bg-web.jpg",
  "https://omniumcargo.dk/wp-content/uploads/2021/11/Omnium-TI_CXC-Riser_Bike.jpg",
  "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmljeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60",
  "https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmljeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60",
  "https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YmljeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60",
  "https://images.unsplash.com/photo-1583227122027-d2d360c66d3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJpY3ljbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60",
  "https://images.unsplash.com/photo-1618520593672-e227a9030f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGJpY3ljbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60",
  "https://images.unsplash.com/photo-1571333250630-f0230c320b6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJpY3ljbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60"
]

bicycle_addresses = [
  "36 Bd de Sebastopol, 75004 Paris",
  "38 Rue Saint-Sulpice, 75006 Paris",
  "20 Rue Miollis, 75015 Paris",
  "14 Rue Claude Lorrain, 75016 Paris",
  "1 Av. General Sarrail, 75016",
  "283-285 Rue Lecourbe, 75015 Paris",
  "102 Av. du Général Leclerc, 75014 Paris",
  "45 Rue des Petits Carreaux, 75002 Paris",
  "10 Rue de la Victoire, 75009 Paris",
  "13 Rue Rambuteau, 75004 Paris",
  "54 Av. des Gobelins, 75013 Paris",
  "88 Rue Mstislav Rostropovitch, 75017 Paris",
  "58 Rue d'Aubervilliers, 75019 Paris"
]

puts "Destroying previous records"
User.destroy_all
Bicycle.destroy_all
puts "Previous records destroyed"

puts "Creating users"
User.create!(email: "test1@test.fr", password: "123456", first_name: "Sam", last_name: "Paget")

9.times do
  User.create!(email: Faker::Internet.unique.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
puts "Users created"

puts "Creating bicycles"
20.times do
  Bicycle.create!(
    title: Faker::Lorem.sentence(word_count: rand(1..5)),
    category: Bicycle::CATEGORIES.sample,
    description: Faker::Lorem.paragraph,
    price_per_day: rand(1000..15_000),
    size: Bicycle::SIZES.sample,
    user: User.all.sample,
    photo: bicycle_images.sample,
    address: bicycle_addresses.sample
  )
end
puts "#{Bicycle.all.length} Bicycles Created"

puts "Creating bookings"
10.times do
  b = Booking.new(
    bicycle: Bicycle.all.sample,
    start_date: Faker::Date.between(from: '2022-09-01', to: '2023-09-30')
  )
  b.end_date = Faker::Date.between(from: b.start_date + 1, to: rand(1..10).days.since(b.start_date))
  b.save!
end
puts "Bookings created"

puts "Creating reservations"
15.times do
  r = Reservation.new(
    bicycle: Bicycle.all.sample,
    user: User.all.sample,
    start_date: Faker::Date.between(from: '2022-09-01', to: '2023-09-28')
  )
  r.end_date = Faker::Date.between(from: r.start_date + 1, to: rand(1..10).days.since(r.start_date))
  r.save!
end
  puts "Reservations created"
