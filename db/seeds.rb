# frozen_string_literal: true

require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CATEGORIES = %w[chinese italian japanese french belgian].freeze

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

RESTAURANTS = Restaurant.all

50.times do
  restaurant = RESTAURANTS.sample
  Review.create(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant: restaurant
  )
end
