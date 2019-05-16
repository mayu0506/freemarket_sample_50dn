class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :buy]


  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    
  end

  def buy
  end

  private

  def product_params
    # params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :delivering_date)

    params.require(:product).permit(:name, :description, :price,)
  end



end
