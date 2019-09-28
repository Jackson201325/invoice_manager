class Invoice < ApplicationRecord
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
end
