class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  def callback_from(provider)
    @user = User.find_or_create_by_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      # session["devise.#{provider}_data"] = request.env['omniauth.auth']
      session[:email] = @user.email
      session[:nickname] = @user.nickname
      session[:uid] = @user.uid
      session[:provider] = @user.provider
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      redirect_to new_user_registration_url
    end
  end
end
