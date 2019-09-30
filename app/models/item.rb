class Item < ApplicationRecord
  # Model association
  belongs_to :invoice

  # Validations
  validates_presence_of :name, :description, :company, :url, :cost_price_usd, :order

  validates_numericality_of :order, :cost_price_usd #:profit, :total_cost_price_pyg, :total_revenue allow_nil: true
end
