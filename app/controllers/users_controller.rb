class UsersController < ApplicationController
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
    @products = current_user.products
  end
  
  def identification
    @userName = "#{current_user.first_name}" + " " + "#{current_user.last_name}"
    @userName_kana = "#{current_user.kana_first_name}" + " " + "#{current_user.kana_last_name}"
  end
end
