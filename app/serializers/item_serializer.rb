class ItemSerializer < ActiveModel::Serializer
  # Attributes to be serialized
  attributes :id, :name, :model, :description, :color, :company, :year, :url,
             :cost_price, :sales_price, :order, :total_revenue, :invoice_id,
             :total_cost, :profit, :confirm

  # Model association
  belongs_to :invoice
end
