class ProductsController < ApplicationController
  def index
    @products = Product.all # instance variable to share view between controllers
  end
end
