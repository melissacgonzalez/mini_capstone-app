class Product < ApplicationRecord
  def discounted?
    price.to_s.end_with?(".97")
  end

  def tax
    return price * 0.09 
  end

  def total
    return price + tax
  end

  def in_stock?
    if self.quantity == nil
      self.quantity = 0
    end
    return quantity > 0
  end
end
