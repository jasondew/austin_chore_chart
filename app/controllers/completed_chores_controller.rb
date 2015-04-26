class CompletedChoresController < ApplicationController
  def create
    CompletedChore.create! chore_id: params[:id], completed_on: params[:day]
    redirect_to root_path, notice: praise.sample
  end

  def destroy
    CompletedChore.find_by(chore_id: params[:id], completed_on: params[:day]).destroy!
    redirect_to root_path, notice: "Chore has been undone."
  end
end
