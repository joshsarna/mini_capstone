json.array! @products.each do |product|
  json.book product

  json.formatted do
    json.discounted product.is_discounted?
    json.tax product.tax
    json.total product.total
  end
end