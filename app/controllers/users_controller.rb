class UsersController < ApplicationController
  before_action :set_user, only:[:identification,:list]
  def show
  end

  def new  
    @users = User.new
  end
  
  def update
  end

  def logout
  end

  def list
    @products = @user.products
  end
  
  def identification
    @userName = "#{@user.first_name}" + " " + "#{@user.last_name}"
    @userName_kana = "#{@user.kana_first_name}" + " " + "#{@user.kana_last_name}"
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
