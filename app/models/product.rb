class Product < ApplicationRecord
  def sale_method
    if price < 2
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end

  def discounted?
    if sale_method == "Discount Item!"
      return "discount-item"
    else
      return ""
    end
  end

  def tax
    return price * 0.09 
  end

  def total
    return price + tax
  end
end
