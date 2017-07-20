class ProductsController < ApplicationController
  def index
    sort_attribute = params[:sort_by]
    sort_order = params[:sort_order]
    discounted = params[:discounted]

    search = params[:search_input]
    
    if search
      @products = Product.where("name ILIKE ? OR description ILIKE ?", 
      "%#{search}%", "%#{search}%")
    elsif discounted
      @products = Product.where("cast(price as text) LIKE ?", "%.97")
    else
      @products = Product.all
    end

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    end 

    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity]
      )
    @product.save
    flash[:success] = "New Product #{@product.name} Successfully Created!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params["id"] == "random"
      @product = Product.order("random()").first
    else
      @product = Product.find_by(id: params["id"])
    end
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
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
