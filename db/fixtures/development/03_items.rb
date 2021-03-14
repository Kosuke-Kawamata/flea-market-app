20.times do |n|
  Item.seed do |s|
    s.id = n+1
    s.name = "アイテム#{n+1}"
    s.description = 'よろしくおねがいしまっす！！！'
    s.img = Rails.root.join("app/assets/images/sample_#{rand(1..11)}.jpeg").open
    s.price = rand(300..10000)
    s.sold_flag = false
    s.status = 0
    s.category_id = rand(1..9)
    s.user_id = rand(1..13)
  end
end
