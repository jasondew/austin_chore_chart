class Child < ActiveRecord::Base
  belongs_to :parent

  has_many :chores
  has_many :completed_chores
  has_many :payments
end
