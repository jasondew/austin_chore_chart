class ChoreSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :rate, :notes, :repeating

  has_many :completed_chores
end
