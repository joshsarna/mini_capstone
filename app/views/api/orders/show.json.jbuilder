json.user @order.user
json.products = @carted_products
json.subtotal @order.subtotal
json.tax @order.tax
json.total @order.total
json.created_at @order.created_at
json.updated_at @order.updated_at