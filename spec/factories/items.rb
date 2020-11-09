FactoryBot.define do
  factory :item do
    product             {"商品名"}
    description         {"商品の説明"}
    category_id         { 2 }
    status_id           { 2 }
    burden_id           { 2 }
    area_id             { 2 }
    deliveryday_id      { 2 }
    price               { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
