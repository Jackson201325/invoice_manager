FactoryBot.define do
  factory :item do
    name { Faker::Appliance.equipment }
    model { Faker::Appliance.brand }
    description { Faker::Lorem.paragraph }
    color { Faker::Color.color_name }
    company { Faker::Company.name }
    year { Faker::Number.between(from: 1, to: 5) }
    url { Faker::Internet.domain_name }
    cost_price { Faker::Number.between(from: 5, to: 50) }
    sales_price { Faker::Number.between(from: 5, to: 50) * 6400 }
    order { Faker::Number.between(from: 5, to: 50) }
    total_revenue { sales_price * order }
    total_cost { cost_price * order }
    profit { profit_per_unit * order }
    invoice_id  { nil }
    confirm { false }
  end
end