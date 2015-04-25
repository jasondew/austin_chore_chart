class Chore < ActiveRecord::Base
  belongs_to :child

  has_many :completed_chores

  def self.week_paid?(day)
    Payment.exists?(week: day.cweek, year: day.cwyear)
  end

  def completed_for?(day)
    completed_chores.exists? completed_on: day.to_date
  end
end
