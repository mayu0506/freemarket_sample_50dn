class ProductsController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :show, :buy, :new, :change]
  before_action :set_product, only: [:change]
  before_action :check_user, only: :buy
  
  def index
    @category_item = ["レディース","メンズ","ベビー・キッズ","コスメ・香水・美容"]
    @categories = Category.where(name: @category_item)
    
  end

  def new
    @product = Product.new
    @image = @product.images.build
    @categories = Category.all

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

    # カテゴリーセレクトボックスの非同期部（時間があれば実装）
    # if params[:r_cat]
    #   @c_cat = Category.find(params[:r_cat]).children
    # else
    #   @g_cat = Category.find(params[:c_cat]).children
    # end
    # respond_to do |format|
    #   format.html
    #   format.json
    # end


    
     
    
  end





  def show
    
  end

  def edit
  end

  def buy
   
  end

  def change
    @image = @product.images.first
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  
  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :deliverying_date, :category_id, images_attributes: [:image])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
