class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :buy, :new, :change]
  before_action :set_product, only: [:change]
  before_action :check_user, only: :buy
  before_action :set_api_for_payjp

  def index
    @category_item = ["レディース","メンズ","ベビー・キッズ"]
    @categories = Category.where(name: @category_item)
    
  end

  def new
    @product = Product.new
    @image = Image.new
    @category = Category.all
  
  end

  def create
    @product = Product.new(params_int(product_params))
    @image = Image.new

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
    # 住所の取得
    @address = Address.find_by(user_id: current_user.id)
    @user = User.find(current_user.id)
    # カード情報の取得
    @payment = Payment.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@payment.customer_id)
    @card_information = customer.cards.retrieve(@payment.card_id)
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :deliverying_date, :user_id)
  #   .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
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

  # 住所登録を済ませたユーザーかどうかのチェック
  def check_user
    if Address.where(user_id: current_user.id).blank?
      redirect_to new_address_path
    end
  end
end
