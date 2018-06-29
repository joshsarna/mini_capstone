require 'unirest'

response = Unirest.patch('localhost:3000/api/products/16', parameters: {input_price: 6.99})
