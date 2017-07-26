class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def sub_tax_total
    subtotal = product.price * quantity
    tax = product.tax * quantity
    total = tax + subtotal
    update(subtotal: subtotal, tax: tax, total: total)
  end
end
