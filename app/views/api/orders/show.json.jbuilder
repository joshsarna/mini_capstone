json.user @order.user
json.products @carted_products
json.subtotal number_to_currency(@order.subtotal)
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total)
json.created_at @order.created_at
json.updated_at @order.updated_at