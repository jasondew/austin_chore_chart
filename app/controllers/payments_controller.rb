class PaymentsController < ApplicationController
  def index
    render json: Payment.all
  end

  def create
    if new_payment.save
      render json: new_payment
    else
      render json: {errors: new_payment.errors},
             status: :unprocessible_entity
    end
  end

  private

  def new_payment
    Payment.new attributes
  end

  def attributes
    params.fetch(:payment, {}).permit(*%w{week year amount})
  end
end
