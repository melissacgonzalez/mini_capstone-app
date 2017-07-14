class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      image: params[:image],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity]
      )
    @product.save
    flash[:success] = "New Product #{@product.name} Successfully Created!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.image = params[:image]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.quantity = params[:quantity]
    @product.save
    flash[:success] = "Product #{@product.name} Successfully Updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    flash[:warning] = "Product Successfully Deleted!"
    @product.destroy
    redirect_to "/products"
  end
end
