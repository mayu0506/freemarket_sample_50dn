class AddressesController < ApplicationController
  require 'jp_prefecture'
  # before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.save
      redirect_to new_payment_path, notice: '住所登録に成功しました'
    else
      redirect_to new_address_path, notice: '登録に失敗しました'
    end
  end

  def edit
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :prefecture_code, :city, :street, :building, :phone).merge(user_id: current_user.id)
  end
end
