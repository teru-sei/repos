FactoryBot.define do
  factory :cafe do
    name { Faker::Name.initials(number: 2) }
    address { '静岡市' }
    purpose_id { 2 }
    prefecture_id { 2 }
    recommend { Faker::Lorem.sentence }

    association :user

    after(:build) do |cafe|
      cafe.image.attach(io: File.open('public/images/1032978.png'), filename: '1032978.png')
    end
  end
end
