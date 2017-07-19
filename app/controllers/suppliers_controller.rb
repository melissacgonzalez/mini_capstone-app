class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all.order(:name)
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    flash[:success] = "#{new_supplier.name} was successfully added!"
    redirect_to "/suppliers/#{new_supplier.id}"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone_number = params[:phone_number]
    supplier.save
    flash[:success] = "#{supplier.name} was successfully updated!"
    redirect_to "/suppliers/#{supplier.id}"
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier_name = supplier.name
    supplier.destroy
    flash[:warning] = "#{supplier_name} was successfully deleted!"
    redirect_to "/suppliers"
  end

end
