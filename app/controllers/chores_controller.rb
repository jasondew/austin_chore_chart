class ChoresController < ApplicationController
  def index
    render json: Chore.all
  end

  def create
    if new_chore.save
      render json: new_chore
    else
      render json: {errors: new_chore.errors}, status: :unprocessible_entity
    end
  end

  private

  def new_chore
    @new_chore ||= Chore.new attributes
  end

  def attributes
    params.fetch(:chore, {}).permit(*%w{name rate notes repeating})
  end
end
