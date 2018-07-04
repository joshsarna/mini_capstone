require 'unirest'

# response = Unirest.delete("localhost:3000/api/products/27")

response = Unirest.post("localhost:3000/api/products", parameters: 
  {
    name: "book",
    author: "a",
    price: "b",
    description: "c",
    format: "d",
    condition: "e",
    image_url: "f"
  }
)

# response = Unirest.patch("localhost:3000/api/products/28")