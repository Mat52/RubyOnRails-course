class ProductsController < ApplicationController
  def index
    @products = Product.all # instance variable to share view between controllers
  end

  def show
    @product = Product.find(params[:id])  # Add function to show product with the id specified in request R in CRUD model 
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save #checking if save is true if yes product is save
      redirect_to @product #redirect to site of product
    else
      render :new, status: :unprocessable_entity #if cannot save show unprocessable_entity error
    end
  end

  private
    def product_params #added params to handle with form
      params.expect(product: [ :name ]) 
    end

end
