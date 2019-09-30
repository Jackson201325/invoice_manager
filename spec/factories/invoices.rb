FactoryBot.define do
  factory :invoice do
    total_spend { Faker::Number.between(from: 1_500_000, to: 2_500_000) }
    total_net_sales { Faker::Number.between(from: 2_000_000, to: 3_000_000) }
    total_profit { total_net_sales - total_spend }
    # items { []}
  end
end