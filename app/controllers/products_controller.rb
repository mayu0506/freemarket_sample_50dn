class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :buy, :new, :change, :search]
  before_action :set_product, only: [:show,:change,:edit, :update,:destroy, :status_update]
  before_action :check_address, only: :buy
  before_action :check_payment, only: :buy
  before_action :set_api_for_payjp

  def index
    @ladies = Category.find_by(name: "レディース")
    @ladies_products = search_product(@ladies)
    @mens = Category.find_by(name: "メンズ")
    @mens_products = search_product(@mens)
    @baby = Category.find_by(name: "ベビー・キッズ")
    @baby_products = search_product(@baby)
    @beauty = Category.find_by(name: "コスメ・香水・美容")
    @beauty_products = search_product(@beauty)
  end


  def new
    @product = Product.new
    @image = @product.images.build
    @categories = Category.all
  end


  def create
    @product = Product.new(product_params)
    logger.debug @product.errors.inspect
    if @product.save
      params[:images]['image'].reverse.each do |i|
        @image = @product.images.create!(image:i)
      end
      redirect_to change_product_path(@product)
    else
      render 'new'
    end
  end


  def search
    # あいまい検索
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(20).order("id DESC")
    @count = @products.count
    # 最新情報の取得
    @new_products = Product.where(params[:id]).limit(20).order("id DESC") 
    # 何も検索されてない場合ルートに戻る
    redirect_to root_path if params[:keyword] == ""
  end


  def show
    @product = Product.find(params[:id])
  end


  def edit
    @images = @product.images
    @category = @product.category
    @categories = Category.all
  end


  def update 
    if @product.update(product_params)
      redirect_to change_product_path(@product)
    else
      render 'edit'
    end
  end


  def status_update
    @product.update(status_params)
    redirect_to list_user_path(current_user)
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
  end

  def destroy
    @product.destroy
    redirect_to list_user_path(current_user)
  end

  private

  def search_product(category)
    return Product.where(category_id: category.subtree_ids).limit(4).order("created_at DESC")
  end

  def set_product
    @product = Product.find(params[:id])
    @image = @product.images.limit(5)
  end

  def status_params
    params.require(:product).permit(:status)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :who_to_pay, :origin_of_delivery, :size, :deliverying_date, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # 以下で住所登録とクレジットカード登録を済ませたユーザーかどうかのチェック
  def check_address
    if Address.where(user_id: current_user.id).blank?
       redirect_to new_address_path
    end
  end

  def check_payment
    if Payment.where(user_id: current_user.id).blank?
       redirect_to new_payment_path
    end
  end
end
