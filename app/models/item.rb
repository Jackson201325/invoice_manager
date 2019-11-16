class Item < ApplicationRecord
  after_create :default_values
  after_update :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
               :calculate_sales_price
  after_validation :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
                   :calculate_sales_price
  after_save :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
             :calculate_sales_price

  before_create :default_values
  before_validation :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
                    :calculate_sales_price
  before_update :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
                :calculate_sales_price
  before_save :calculate_total_cost, :calculate_profit, :calculate_total_revenue,
              :calculate_sales_price

  # Model association
  belongs_to :invoice

  # Validations
  validates_presence_of :name, :description, :company, :url, :cost_price,
                        :order

  validates_numericality_of :order, :cost_price #:profit, :total_cost_price, :total_revenue allow_nil: true

  def default_values
    if order.nil? || confirm.nil?
      self.order ||= 1
      self.confirm ||= false
    end
  end

  def calculate_total_cost
    unless order.nil? || cost_price.nil?
      self.total_cost = cost_price.to_i * order
    end
  end

  def calculate_sales_price
    unless cost_price.nil?
      self.sales_price = cost_price.to_i + (cost_price.to_i * rand(0.1..0.9))
    end
  end

  def calculate_profit
    unless order.nil? || sales_price.nil?
      self.profit = (sales_price.to_i - cost_price.to_i ) * order
    end
  end

  def calculate_total_revenue
    unless order.nil? || sales_price.nil?
      self.total_revenue = sales_price.to_i * order
    end
  end


end
