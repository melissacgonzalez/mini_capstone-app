class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products


  def sub_tax_total
    carted_products = user.carted_products.where("status = ?", "carted")
    prices = carted_products.map{|carted_product| carted_product.subtotal}
    subtotal = prices.reduce(0){|sum, price| sum + price}
    taxes = carted_products.map{|carted_product| carted_product.tax}
    tax = taxes.reduce(0){|sum, tax| sum + tax}
    total = tax + subtotal
    update(subtotal: subtotal, tax: tax, total: total)
  end

  def mark_purchased
    carted_products = user.carted_products.where("status = ?", "carted")
    carted_products.update_all(status: "purchased", order_id: id)
  end
end
