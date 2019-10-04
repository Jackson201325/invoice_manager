class Invoice < ApplicationRecord
  before_update { calculate_profit }
  before_create { calculate_profit }

  # Model association
  has_many :items, dependent: :destroy
  # Validations
  validates :total_spend, numericality: { only_integer: true,
                                          message: 'Must be a number' },
                          allow_blank: true
  validates :total_net_sales, numericality: { only_integer: true },
                              allow_blank: true

  validates :total_profit, numericality: { only_integer: true },
                           allow_blank: true

  def calculate_profit
    self.total_profit = total_net_sales - total_spend unless total_net_sales.nil?
  end
end
