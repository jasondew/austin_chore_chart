class ChoresController < ApplicationController
  def index
    render json: Chore.all
  end

  private

  def praise
    [
      "Good job!",
      "Awesome!",
      "Way to go!",
      "You rock!"
    ]
  end
end
