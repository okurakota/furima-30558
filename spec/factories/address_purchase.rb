FactoryBot.define do
  factory :address_purchase do

    token          {"tok_abcdefghijk00000000000000000"}

    postal_code    { "123-4567" }
    prefectures_id { 4 }
    municipalities { "サンプル市" }
    address      { "サンプル1-1" }
    building_name  { "サンプルビル" }
    phone_number   { "12345678910" }

  end
end