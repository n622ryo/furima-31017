FactoryBot.define do
  factory :item_order do
    postcode           { "111-1111"}
    prefecture_id      { 2 }
    city               { "美濃加茂市下米田町今" }
    housenum           { "911番地5" }
    buildname          { "ビル" }
    phonenum           { "00000000000" }
  end
end