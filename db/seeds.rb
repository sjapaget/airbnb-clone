# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Destroying previous records"
User.destroy_all
Bicycle.destroy_all
puts "Previous records destroyed"

puts "Creating users"
User.create!(email: "test1@test.fr", password: "123456", first_name: "Sam", last_name: "Paget")
puts "Users created"

puts "Creating bicycles"
Bicycle.create!(
  title: "test",
  category: "road",
  description: "A test bicycle",
  price_per_day: 1000,
  size: "small",
  user: User.all.first
)
puts "Creating bookings"
Booking.create!(
  bicycle: Bicycle.all.first,
  start_date: "01-09-2022".to_date,
  end_date: "30-09-2022".to_date
)
puts "Bookings created"

puts "Creating reservations"
Reservation.create!(
  bicycle: Bicycle.all.first,
  user: User.all.first,
  start_date: "01-09-2022".to_date,
  end_date: "05-09-2022".to_date
)
puts "Reservations created"
