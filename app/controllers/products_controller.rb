class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :buy, :new]


  def index
  end

  def new
    @product = Product.new
    @image = @product.images.build
  end

  def create
    @product = Product.new(product_params)

   

    if @product.save
      params[:images]['image'].each do |a|
        @image = @product.images.create!(image:a)
      end

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
    params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :deliverying_date, :user_id, images_attributes: [:image])
  end


end
