class ProductsController < ApplicationController
  def index
    #@products = Product.all
    @products = Product.includes(:category).all
  end
end
