class Product < ApplicationRecord
  def sale_method
    if price < 2
      message = "Discount Item!"
    else
      message = "Everyday Value!"
    end
  end

  def discounted?
    if sale_method == "Discount Item!"
      @color = "red"
    else
      @color = "default"
    end
  end

  def tax
    price * 0.09 
  end

  def total
    price + tax
  end
end
