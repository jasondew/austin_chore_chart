class ChoresController < ApplicationController
  def index
    render json: Chore.all
  end

  def complete
    CompletedChore.create! chore_id: params[:id], completed_on: params[:day]
    redirect_to root_path, notice: praise.sample
  end

  def uncomplete
    CompletedChore.find_by(chore_id: params[:id], completed_on: params[:day]).destroy!
    redirect_to root_path, notice: "Chore has been undone."
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
