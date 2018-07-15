class Product < ApplicationRecord
  belongs_to :supplier
  has_many :pictures

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

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Picture.where(product_id: id)
  # end
end
