class PaymentsController < ApplicationController
  # before_action :authenticate_user!, only: :new
  before_action :set_api_for_payjp
  require 'payjp'

  def new
    @payment = Payment.new
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      redirect_to complete_payments_path, notice: '会員登録は全て完了しました。メルカリ(偽)をお楽しみください！'
    else
      redirect_to new_payment_path, alert: 'クレジットカード登録に失敗しました'
    end
  end

  def complete
  end
  
  def show
    if Payment.where(user_id: current_user.id).blank?
      redirect_to edit_payment_path
    else
      @payment = Payment.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@payment.customer_id)
      @card_information = customer.cards.retrieve(@payment.card_id)
    end
  end

  def destroy
    payment = Payment.where(user_id: current_user.id).first
    if payment.blank?
      redirect_to new_payment_path
    else
      customer = Payjp::Customer.retrieve(payment.customer_id)
      customer.delete
      payment.delete
      redirect_to root_path, notice: 'クレジットカード情報の削除が完了しました。'
    end
  end

  def edit
  end

  private

  def set_payment
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end

end
