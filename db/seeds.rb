# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Destroying previous records"
Bicycle.destroy_all
puts "Previous records destroyed"

puts "Creating bicycles"
Bicycle.create!(
  title: "test",
  category: "road",
  description: "A test bicycle",
  price_per_day: 1000,
  size: "small",
  user: User.all.first
)

puts "Bicycles created"
Booking.create!(
  bicycle: Bicycle.all.first,
  start_date: "01-09-2022".to_date,
  end_date: "30-09-2022".to_date
)
