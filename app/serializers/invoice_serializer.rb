class InvoiceSerializer < ActiveModel::Serializer
  # Attributes to be serialized
  attributes :id, :total_spend, :total_net_sales, :total_profit, :created_at,
             :updated_at

  # Model association
  has_many :items
end
