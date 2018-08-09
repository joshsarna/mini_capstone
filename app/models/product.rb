class Product < ApplicationRecord
  belongs_to :supplier
  has_many :pictures
  has_many :genre_products
  has_many :genres, through: :genre_products

  has_many :carted_products
  has_many :users, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 9999999.99 }
  validates :author, presence: true
  validates :description, length: { maximum: 500 }


=begin
price must be > 0
price must be below 99999999.99
=end

  def is_discounted?
    if price && price >= 5
      false
    else
      true
    end
  end

  def discount_message
    if is_discounted?
      "Discount Item!"
    else
      "Everyday Value!"
    end
  end

  def tax
    tax = 0.09
    if price
      (price * tax).round(2)
    end
  end

  def total
    if price
      price + tax
    end
  end

  def first_image
    product.images.first
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Picture.where(product_id: id)
  # end

  # def genres
  #   Genre.where(id: genre_products.genre_id)
  # end
end
