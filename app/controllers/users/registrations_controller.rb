# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :create, only: [:complete]

  def index
  end

  def new
    @user = User.new
  end

  def complete
    render :complte
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      render :complete
    else
      render :new
    end
  end


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name])
  end
end
