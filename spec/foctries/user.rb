FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email    { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    profile  { Faker::Lorem.sentense(max_length: 100) }
  end
end