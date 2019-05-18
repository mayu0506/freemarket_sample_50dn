class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: :new
  require 'payjp'

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    Payjp.api_key = 'sk_test_8b4d3c925604e0aef4191408'
    # 本来は上記の秘密は環境変数として登録すべきですが、みんなで共有するにはどうすればいいかわからないでの保留です。
    # test鍵なので最悪漏れても影響ないです。
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      redirect_to root_path, notice: '会員登録は全て完了しました。メルカリ(偽)をお楽しみください！'
    else
      redirect_to new_payment_path, notice; 'クレジットカード登録に失敗しました'
    end
  end

  def pay
  end

  def edit
  end

  private

  def set_payment
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end
