FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    price { 1.5 }
  end
end
