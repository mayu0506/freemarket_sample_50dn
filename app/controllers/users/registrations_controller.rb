# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :create, only: [:complete]

  def index
    reset_session
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to new_address_path, notice: '会員情報登録に成功しました'
    else
      render :new, notice: '入力に誤りがあります'
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :uid, :provider, :birth_date])
  end
  
end
