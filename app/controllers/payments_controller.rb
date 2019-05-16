class PaymentsController < ApplicationController
  # before_action :authenticate_user!, only: :new
  require 'payjp'
  before_action :set_payment

  def show
  end

  def new
    payment = Payment.where(user_id: current_user.id).first
  end

  def create
  end

  def pay
    Payjp.api_key = 'sk_test_8b4d3c925604e0aef4191408'
    Payjp::Charge.create(
      amount: 1000,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  def edit
  end

  private

  def set_payment
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end
