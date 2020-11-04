FactoryBot.define do
  factory :user do
    nickname { "goto" }
    email {Faker::Internet.free_email}
    password { password }
    password_confirmation { password }
    last_name { "後藤" }
    first_name { "功輝" }
    last_name_kana { "ゴトウ" }
    first_name_kana { "コウキ" }
    birthday { "1997-09-30" }
  end
end