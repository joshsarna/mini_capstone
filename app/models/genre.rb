class Genre < ApplicationRecord
  has_many :genre_products
  has_many :products, through: :genre_products

  # def products
  #   products = []
  #   genre_products.each do |relationship|
  #     products << genre_products.product
  #   end
  #   products
  # end
end
