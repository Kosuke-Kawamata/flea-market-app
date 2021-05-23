User.seed do |s|
  s.id = 1
  s.email = "test@1.com"
  s.name = "ユーザー1"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「1号」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
s.id = 2
  s.email = "qqqq@qq.com"
  s.name = "q"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは､私はqです！\nあああああああああ\nああああああああああああああ\nあああ"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 3
  s.email = "test@user01.com"
  s.name = "user1"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user1」と申します｡\nよろしくおねがい申し上げます"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 4
  s.email = "user@0.com"
  s.name = "user0"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user0」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 5
  s.email = "user@1.com"
  s.name = "user14"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user1」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 6
  s.email = "user@2.com"
  s.name = "user2"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user2」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 7
  s.email = "user@3.com"
  s.name = "user3"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user3」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 8
  s.email = "user@4.com"
  s.name = "user4"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user4」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 9
  s.email = "user@5.com"
  s.name = "user5"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user5」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 10
  s.email = "user@6.com"
  s.name = "user6"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user6」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 11
  s.email = "user@7.com"
  s.name = "user7"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user7」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 12
  s.email = "user@8.com"
  s.name = "user8"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user8」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end
  
User.seed do |s|
  s.id = 13
  s.email = "user@9.com"
  s.name = "user9"
  s.img = Rails.root.join("app/assets/images/item_img/sample_#{rand(1..11)}.jpeg").open
  s.profile = "こんにちは！\n私の名前は「user9」と申します｡\nよろしくおねがい申し上げます｡！"
  s.password = "qqqqqq"
end


# User.seed(
#   {id: 1, 
#   email: "test@1.com",
#   name: "ユーザー1",
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「1号」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 2, 
#   email: "qqqq@qq.com", 
#   name: "q", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは､私はqです！\nあああああああああ\nああああああああああああああ\nあああ",
#   password: "qqqqqq"},
  
#   {id: 3, 
#   email: "test@user01.com", 
#   name: "user1", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user1」と申します｡\nよろしくおねがい申し上げます",
#   password: "qqqqqq"},
  
#   {id: 4, 
#   email: "user@0.com", 
#   name: "user0", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user0」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 5, 
#   email: "user@1.com", 
#   name: "user14", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user1」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 6, 
#   email: "user@2.com", 
#   name: "user2", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user2」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 7, 
#   email: "user@3.com", 
#   name: "user3", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user3」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 8, 
#   email: "user@4.com", 
#   name: "user4", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user4」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 9, 
#   email: "user@5.com", 
#   name: "user5", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user5」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 10, 
#   email: "user@6.com", 
#   name: "user6", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user6」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 11, 
#   email: "user@7.com", 
#   name: "user7", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user7」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 12, 
#   email: "user@8.com", 
#   name: "user8", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user8」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"},
  
#   {id: 13, 
#   email: "user@9.com", 
#   name: "user9", 
#   img: "app/assets/images/user_img/defalut_person.jpg",
#   profile: "こんにちは！\n私の名前は「user9」と申します｡\nよろしくおねがい申し上げます｡！",
#   password: "qqqqqq"}

# )

