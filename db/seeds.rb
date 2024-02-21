# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# valid_product = Product.create(title: "Valid Product", price: 10.99, stock_quantity: 100)
# invalid_product = Product.create(title: "", price: nil, stock_quantity: 50)

#require 'faker'

# 676.times do
#   Product.create!(
#     title: Faker::Commerce.product_name,
#     description: Faker::Lorem.paragraph,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end

require "csv"

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |row|
  category = Category.find_or_create_by(name: row['category'])
  Product.create(title: row['title'], description: row['description'], price: row['price'], stock_quantity: row['stock_quantity'], category: category)
end
