class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :buy, :new]
  before_action :set_product

  def index
    @womens = Product.where(category_id: 14..59).limit(4)
    @mens = Product.where(category_id: 60..70).limit(4)
    @kids = Product.where(category_id: 3).limit(4)
    @cosmetics = Product.where(category_id: 4).limit(4)
  end

  def new
    @product = Product.new
    @image = Image.new
    @category = Category.all
  
  end

  def create
    @product = Product.new(params_int(product_params))
    @image = Image.new


    binding.pry

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
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
    @product.destroy
    redirect_to root_path
  end

  
  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :deliverying_date, :user_id)
  #   .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def image_params
  #   params.require(:image).permit(:image, :product_id)
  # end


  #フォームに入力されたセレクトボックスの文字列を数値に変換する
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
 end

  def params_int(product_params)
    product_params.each do |key,value|
      if integer_string?(value)
        product_params[key]=value.to_i
      end
    end
  end

end
