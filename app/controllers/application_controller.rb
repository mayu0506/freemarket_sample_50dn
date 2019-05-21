class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_api_for_payjp
    Payjp.api_key = 'sk_test_8b4d3c925604e0aef4191408'
    # 本来は上記の秘密は環境変数として登録すべきですが、みんなで共有するにはどうすればいいかわからないでの保留です。
    # test鍵なので最悪漏れても影響ないです。
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :uid, :provider, :birth_date])
  end
end
