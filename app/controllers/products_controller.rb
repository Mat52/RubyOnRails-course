class ProductsController < ApplicationController
  def index
    @products = Product.all # instance variable to share view between controllers
  end

  def show
    @product = Product.find(params[:id])  # Add function to show product with the id specified in request R in CRUD model 
  end
end
