# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# supplier = Supplier.new(name: "Harper Collins", email: "hp@books.com", phone_number: "123")
# supplier.save
# supplier = Supplier.new(name: "Ballantine Books", email: "bb@books.com", phone_number: "456")
# supplier.save
# supplier = Supplier.new(name: "Viking", email: "v@books.com", phone_number: "789")
# supplier.save

# products = Product.all
# products.each do |product|
#   if product.image_url
#     picture = Picture.new(
#       url: product.image_url,
#       product_id: product.id
#     )
#     picture.save
#   end
# end

product = Product.find(49)
product.destroy
product = Product.find(50)
product.destroy

Picture.create(url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8e/Darkhalf.jpg/200px-Darkhalf.jpg", product_id: "9") # The Dark Half
Picture.create(url: "https://images.gr-assets.com/books/1347606533l/360253.jpg", product_id: "14") # The Gathering Storm
Picture.create(url: "https://upload.wikimedia.org/wikipedia/en/e/e1/Next_book_cover.png", product_id: "15") # Next
Picture.create(url: "https://upload.wikimedia.org/wikipedia/en/thumb/3/33/Jurassicpark.jpg/220px-Jurassicpark.jpg", product_id: "16") # Jurassic Park
Picture.create(url: "https://upload.wikimedia.org/wikipedia/en/thumb/5/5a/Prey_%28Michael_Crichton_novel_-_cover_art%29.jpg/220px-Prey_%28Michael_Crichton_novel_-_cover_art%29.jpg", product_id: "19") # Prey
Picture.create(url: "https://images-na.ssl-images-amazon.com/images/I/51nv-nmEtLL._SX322_BO1,204,203,200_.jpg", product_id: "24") # On the Geneology of Morality
Picture.create(url: "https://images.penguinrandomhouse.com/cover/9780141395852", product_id: "25") # Letters from a Stoic
Picture.create(url: "https://images-na.ssl-images-amazon.com/images/I/51FqKk4TkpL._SX330_BO1,204,203,200_.jpg", product_id: "26") # Cosmopolitan