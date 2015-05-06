class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :week, :year, :amount
end
