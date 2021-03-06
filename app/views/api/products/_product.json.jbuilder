json.id product.id
json.title product.name
json.author product.author
json.price product.price
json.format product.format
json.condition product.condition
json.description product.description

json.formatted do
  json.discounted product.is_discounted?
  json.tax product.tax
  json.total product.total
  json.discount_message product.discount_message
  json.supplier product.supplier
  json.images product.pictures
  json.genres product.genres
end