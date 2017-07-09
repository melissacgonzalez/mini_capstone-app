class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(name: params["name"])
    @name = @product.name
    @price = @product.price
    @description = @product.description
    @image = @product.image
    render "show.html.erb"
  end
end
