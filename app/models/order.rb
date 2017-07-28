class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products


  def sub_tax_total
    subtotal = product.price * quantity
    tax = product.tax * quantity
    total = tax + subtotal
    update(subtotal: subtotal, tax: tax, total: total)
  end

  def tax_total
    tax = subtotal * 0.09
    total = tax + subtotal
    update(tax: tax, total: total)
  end

end
