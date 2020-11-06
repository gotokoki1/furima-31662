FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    prepare_day_id { 2 }
    price { 3000 }
    image { File.open('public/images/test_image.png')}
    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
