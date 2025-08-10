class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ] #we can use it before functions in this example before show edit and update we ivoke function that is determined in the bottom
  allow_unauthenticated_access only: %i[ index show ] #add option to allow unauthenticated users to show index and show only
  def index
    @products = Product.all # instance variable to share view between controllers
  end

  def show
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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params #added params to handle with form
      params.expect(product: [ :name, :description, :featured_image ]) 
    end

end
