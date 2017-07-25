class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    order = Order.create(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id]
      )
    
    order.subtotal = product.price * order.quantity
    order.tax = (order.quantity * product.tax).round(2)
    order.total = order.tax + order.subtotal

    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params["id"])
    render "show.html.erb"
  end

end
