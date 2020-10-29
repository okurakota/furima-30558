FactoryBot.define do
  factory :product do
    name             { Faker::Lorem.sentence }
    description      { Faker::Lorem.sentence }
    category_id      { 4 }
    status_id        { 4 }
    shopping_cost_id { 4 }
    prefecture_id    { 4 }
    shopping_day_id  { 4 }
    price            { 1111111 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
