class PaymentsController < ApplicationController
  # before_action :authenticate_user!, only: :new
  require 'payjp'

  def show
  end

  def new
    # master = User.find(3)
    # payment = Payment.new
  end

  def create
    # Payjp.api_key = 'sk_test_8b4d3c925604e0aef4191408'
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: '2', customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      redirect_to root_path, notice: '会員登録は全て完了しました'
    else
      redirect_to new_payment_path
    end
  end

  def pay
  end

  def edit
  end

  private

  def set_payment
    # @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end
