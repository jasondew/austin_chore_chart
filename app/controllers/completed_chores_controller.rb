class CompletedChoresController < ApplicationController
  def create
    completed_chore = CompletedChore.new attributes

    if completed_chore.save
      render json: completed_chore
    else
      render json: {errors: completed_chore.errors}
    end
  end

  def destroy
    completed_chore = CompletedChore.find_by(chore_id: params[:id], completed_on: params[:day])

    if completed_chore.destroy
      render json: completed_chore
    else
      render json: {errors: completed_chore.errors}
    end
  end

  private

  def attributes
    params.require(:completed_chore).permit(:chore_id, :completed_on)
  end
end
