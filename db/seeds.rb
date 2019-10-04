# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  invoice = Invoice.create!(created_by: User.first.id)
  38.times do
    invoice.items.create!(
      name: Faker::Appliance.equipment,
      model: Faker::Device.model_name,
      description: Faker::Lorem.paragraphs(number: 1),
      color: Faker::Color.color_name,
      company: Faker::Company.name,
      year: Faker::Date.birthday(min_age: 18, max_age: 65),
      url: Faker::Internet.url,
      cost_price_usd: Faker::Number.between(from: 2, to: 125),
      order: Faker::Number.between(from: 1, to: 100),
      confirm: false
    )
  end
end