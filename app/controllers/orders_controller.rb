class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    order = Order.create(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id]
      )
    order.sub_tax_total
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params["id"])
    render "show.html.erb"
  end

end
