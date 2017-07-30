class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  def subtotal
    return product.price * quantity
  end

  def tax
    return product.tax * quantity
  end

  def total
    return (product.price + product.tax) * quantity
  end
end
