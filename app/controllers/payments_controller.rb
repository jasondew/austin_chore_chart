class PaymentsController < ApplicationController
  def create
    Payment.create! attributes
    redirect_to root_path, notice: "You got it, boss!"
  end

  private

  def attributes
    params.permit(*%w{week year amount})
  end
end
