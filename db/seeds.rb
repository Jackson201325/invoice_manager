# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  email: 'a@a.com',
  password: '123123',
  password_confirmation: '123123',
  name: 'Jackson'
)

user2 = User.create!(
  email: 'b@b.com',
  password: '123123',
  password_confirmation: '123123',
  name: 'Jazmin'
)
4.times do
  invoice = Invoice.create!(
    total_spend: 0,
    total_net_sales: 0,
    created_by: user.id,
    total_profit: 0
  )
  38.times do
    invoice.items.create!(
      name: Faker::Appliance.equipment,
      model: Faker::Device.model_name,
      description: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true,
                                          random_sentences_to_add: 4),
      color: Faker::Color.color_name,
      company: Faker::Company.name,
      year: Faker::Date.birthday(min_age: 18, max_age: 65),
      url: Faker::Internet.url,
      cost_price: Faker::Number.between(from: 2, to: 125),
      order: Faker::Number.between(from: 1, to: 100),
      confirm: false
    )
  end
end

4.times do
  invoice = Invoice.create!(
    total_spend: 0,
    total_net_sales: 0,
    created_by: user2.id,
    total_profit: 0
  )
  38.times do
    invoice.items.create!(
      name: Faker::Appliance.equipment,
      model: Faker::Device.model_name,
      description: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true,
                                          random_sentences_to_add: 4),
      color: Faker::Color.color_name,
      company: Faker::Company.name,
      year: Faker::Date.birthday(min_age: 18, max_age: 65),
      url: Faker::Internet.url,
      cost_price: Faker::Number.between(from: 2, to: 125),
      order: Faker::Number.between(from: 1, to: 100),
      confirm: false
    )
  end
end