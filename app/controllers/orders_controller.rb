class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    order = Order.create(user_id: current_user.id)
    order.sub_tax_total
    order.mark_purchased
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params["id"])
    render "show.html.erb"
  end

end
