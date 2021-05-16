
FactoryBot.define do
  factory :item do
    name { 'テストアイテム' }
    description {'説明です'}
    association :user
    association :category
    association :brand
    price {rand(300..10000)}
    sold_flag {false}
    status {0}
    user_id {rand(1..13)}
    item_condition_id {rand(1..6)}
    shipping_fee {rand(1..2)}
    shipping_date {rand(1..3)}
    shipping_way_id {rand(1..10)}
    brand_id {rand(1..20)}
    prefecture_id {rand(1..47)}
  end
end