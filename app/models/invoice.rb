class Invoice < ApplicationRecord
  before_update { calculate_profit }
  # Model association
  has_many :items, dependent: :destroy
  # Validations
  validates :total_spend, numericality: { only_integer: true,
                                          message: 'Must be a number' },
                          presence: true, allow_blank: false
  validates :total_net_sales, numericality: { only_integer: true },
                              allow_blank: true

  validates :total_profit, numericality: { only_integer: true },
                           allow_blank: true

  def calculate_profit
    put 'hello'
    if total_net_sales? do
      return self.total_profit = total_spend - total_net_sales
    end
    end
  end
end
