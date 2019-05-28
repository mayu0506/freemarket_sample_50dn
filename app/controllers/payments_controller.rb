class PaymentsController < ApplicationController
  # before_action :authenticate_user!, only: :new
  before_action :set_api_for_payjp
  require 'payjp'

  def new
    @payment = Payment.new
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: session[:user_id], customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      session[:user_id] = @payment.user_id
      redirect_to root_path(session[:user_id]), notice: '会員登録は全て完了しました。メルカリ(偽)をお楽しみください！'
    else
      redirect_to new_payment_path, alert: 'クレジットカード登録に失敗しました'
    end
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

  def edit
  end

  private

  def set_payment
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end

end
