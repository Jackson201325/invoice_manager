FactoryBot.define do
  factory :item do
    name { Faker::Appliance.equipment }
    model { Faker::Appliance.brand }
    description { Faker::Lorem.paragraph }
    color { Faker::Color.color_name }
    company { Faker::Company.name }
    year { Faker::Number.between(from: 1, to: 5) }
    url { Faker::Internet.domain_name }
    cost_price_usd { Faker::Number.between(from: 5, to: 50) }
    cost_price_pyg { cost_price_usd * 6400 }
    sales_price_pyg { Faker::Number.between(from: 5, to: 50) * 6400 }
    profit_per_unit { sales_price_pyg - cost_price_pyg }
    order { Faker::Number.between(from: 5, to: 50) }
    total_revenue { sales_price_pyg * order }
    profit { profit_per_unit * order }
    invoice_id  nil
    total_cost_price_pyg { cost_price_usd * 6400 * order }
    confirm { false }
  end
end