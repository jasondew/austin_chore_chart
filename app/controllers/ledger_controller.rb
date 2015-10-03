class LedgerController < ApplicationController
  def show
    render json: CompletedChore.all
  end
end
