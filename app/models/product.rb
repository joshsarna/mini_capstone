class Product < ApplicationRecord
  def is_discounted?
    if price && price >= 5
      return false
    else
      return true
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
end
