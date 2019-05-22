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
  
  def identification
    @user = User.find(current_user.id)
    @userName = "#{@user.first_name}" + " " + "#{@user.last_name}"
    @userName_kana = "#{@user.kana_first_name}" + " " + "#{@user.kana_last_name}"
  end
end
