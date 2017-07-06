class ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "products.html.erb"
  end

  def unicorn_tears_method
    @unicorn_tears = Product.find_by(id: 1)
    render "unicorn_tears.html.erb"
  end
end
