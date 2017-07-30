class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where("status = ?", "carted")
    @subtotal = @carted_products.map{
      |carted_product| carted_product.subtotal}.reduce(0){|sum, price| sum + price}
    @tax = @carted_products.map{
      |carted_product| carted_product.tax}.reduce(0){|sum, tax| sum + tax}
    @total = @tax + @subtotal
    if @carted_products == []
      flash[:danger] = "Your Shopping Cart is Empty."
      redirect_to "/products"
    else
      render "index.html.erb"
    end
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted'
      )
    redirect_to "/checkout"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    flash[:warning] = "Product Successfully Removed!"
    carted_product.status = "removed"
    carted_product.save
    redirect_to "/"
  end
end
