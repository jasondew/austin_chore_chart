class CompletedChore < ActiveRecord::Base
  belongs_to :child
  belongs_to :chore

  validates_presence_of :chore_id, :completed_on
  validates_uniqueness_of :completed_on, scope: [:child_id, :chore_id]

  scope :unpaid, -> { where paid_on: nil }
end
