class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :buy]

  def index
    @womens = Product.where(category_id: 14..59).limit(4)
    @mens = Product.where(category_id: 60..70).limit(4)
    @kids = Product.where(category_id: 3).limit(4)
    @cosmetics = Product.where(category_id: 4).limit(4)


  end

  def new
  end

  def show
  end

  def edit
  end

  def buy
  end


  def delete
    @product = Product.find(params[:product_id])
    @image = @product.images.first

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
end
