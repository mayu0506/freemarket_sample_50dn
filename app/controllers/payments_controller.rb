class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_api_for_payjp
  require 'payjp'

  def new
    @payment = Payment.new
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      redirect_to root_path, notice: '会員登録は全て完了しました。メルカリ(偽)をお楽しみください！'
    else
      redirect_to new_payment_path, notice; 'クレジットカード登録に失敗しました'
    end
  end

  def show
    @payment = Payment.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@payment.customer_id)
    @card_information = customer.cards.retrieve(@payment.card_id)
  end

  def edit
  end

  private

  def set_payment
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end
