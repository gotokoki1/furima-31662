FactoryBot.define do
  factory :order do
    post_code { "418-0022" }
    prefecture_id { 2 }
    city { "富士宮市" }
    house_number { "小泉566-18" }
    building_name { "フラット" }
    phone_number { "08043020930" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end