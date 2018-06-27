# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "The Terminal Man", price: "5.99", description: "paperback book by Michael Crichton")
product.save
product = Product.new(name: "A Mad Desire to Dance", price: "25.00", description: "hardcover book by Elie Wiesel")
product.save
product = Product.new(name: "The Dark Half", price: "21.95", description: "hardover book by Stephen King")
product.save