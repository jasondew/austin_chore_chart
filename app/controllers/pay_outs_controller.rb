class PayOutsController < ApplicationController
  def create
    CompletedChore.unpaid.update_all paid_on: Date.current
    render json: true, status: 200
  end
end
