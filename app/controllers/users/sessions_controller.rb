# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     # Log the user in and redirect to the user's show page.
  #   else
  #     flash[:danger] = 'Invalid email/password combination' # Not quite right!
  #     render 'new'
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
