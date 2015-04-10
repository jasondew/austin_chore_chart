class ChartsController < ApplicationController
  def show
  end

  private

  helper_method def total
    CompletedChore.where(completed_on: days).to_a.sum {|cc| cc.chore.rate }
  end

  helper_method def chores
    Chore.all
  end

  helper_method def days
    @days ||= beginning_of_week..end_of_week
  end

  helper_method def payday
    days.last
  end

  def beginning_of_week
    today.beginning_of_week(:saturday)
  end

  def end_of_week
    today.end_of_week(:saturday)
  end

  helper_method def today
    params.fetch(:today, Date.current).to_date
  end
end
