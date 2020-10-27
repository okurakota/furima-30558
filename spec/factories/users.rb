FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    family_name           { '大倉' }
    first_name            { '広大' }
    family_name_kana      { 'オオクラ' }
    first_name_kana       { 'コウタ' }
    birth_day             { '1993-04-10' }
  end
end
