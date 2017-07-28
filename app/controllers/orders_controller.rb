class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where("status = ?", "carted")
    prices = carted_products.map{|carted_product| carted_product.product.price }
    calc_subtotal = prices.reduce(0){|sum, price| sum + price }
    order = Order.create(
      user_id: current_user.id,
      subtotal: calc_subtotal,
      )
    order.tax_total
    order.save
    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id
      carted_product.save
    end
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params["id"])
    render "show.html.erb"
  end

end
