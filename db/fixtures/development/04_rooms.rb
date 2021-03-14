20.times do |n|
  Room.seed do |s|
    s.id = n+1
    s.item_id = n+1
    s.chat_type = 0
  end
end