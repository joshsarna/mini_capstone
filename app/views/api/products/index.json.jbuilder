# json.array! @products.each do |product|
# json.book do
#   json.title product.name
#   json.author product.author
#   json.price product.price
#   json.format product.format
#   json.condition product.condition
#   json.image_url product.image_url
#   json.description product.description
# end

#   json.formatted do
#     json.discounted product.is_discounted?
#     json.tax product.tax
#     json.total product.total
#     json.discount_message product.discount_message
#   end
# end

json.array! @products, partial: 'product', as: :product