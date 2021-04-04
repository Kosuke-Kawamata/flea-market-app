50.times do |n|
  Item.seed do |s|
    s.id = n+1
    s.name = "アイテム#{n+1}"
    s.description = 'よろしくおねがいしまっす！！！'
    s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
    s.price = rand(300..10000)
    s.sold_flag = false
    s.status = 0
    s.category_id = rand(1..9)
    s.user_id = rand(1..13)
    s.item_condition_id = rand(1..6)
    s.shipping_fee = rand(1..2)
    s.shipping_date = rand(1..3)
    s.shipping_way_id = rand(1..10)
    s.brand_id = rand(1..20)
    s.prefecture_id = rand(1..47)
  end
end
