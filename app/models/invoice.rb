class Invoice < ApplicationRecord
  after_create  :total_net_sales, :total_spend, :total_profit
  # after_update :total_net_sales, :total_spend, :total_profit
  # after_validation :total_net_sales, :total_spend, :total_profit
  # after_save :total_net_sales, :total_spend, :total_profit

  # before_create :total_net_sales, :total_spend, :total_profit
  # before_update :total_net_sales, :total_spend, :total_profit
  # before_save :total_net_sales, :total_spend, :total_profit
  before_validation :total_net_sales, :total_spend, :total_profit

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

  private

  def total_net_sales
    net_sales = 0
    items&.each do |item|
      net_sales += item.sales_price.to_i * item.order
    end
    self.total_net_sales = net_sales
  end

  def total_spend
    expense = 0
    items&.each do |item|
      expense += item.total_cost.to_i
    end
    self.total_spend = expense

  end

  def total_profit
    profit = 0
    items&.each do |item|
      profit += item.profit.to_i
    end
    self.total_profit = profit
  end
end