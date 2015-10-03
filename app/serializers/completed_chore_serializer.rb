class CompletedChoreSerializer < ActiveModel::Serializer
  attributes :id, :chore_id, :chore, :completed_on, :paid_on
end
