# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "The Terminal Man", price: "5.99", author: "Michael Crichton", format: "mass market paperback", condition: "good")
product.save
product = Product.new(name: "A Mad Desire to Dance", price: "25.00", author: "Elie Wiesel", format: "hardcover", condition: "good")
product.save
product = Product.new(name: "The Dark Half", price: "21.95", author: "Stephen King", format: "hardcover", condition: "library withdrawal")
product.save
product = Product.new(name: "Spook Country", price: "15.00", author: "William Gibson", format: "trade paperback", condition: "good")
product.save