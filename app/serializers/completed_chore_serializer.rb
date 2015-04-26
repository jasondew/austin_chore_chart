class CompletedChoreSerializer < ActiveModel::Serializer
  attributes :id, :chore_id, :completed_on
end
