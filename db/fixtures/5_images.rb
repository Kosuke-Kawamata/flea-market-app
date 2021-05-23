
for n in 1..300 do 

  array = (1..10).to_a.sample(3)      
  num1 = array[0]
  num2 = array[1]
  num3 = array[2]

  Image.seed do |s|
    # s.id =  idはseedで記載されていなければ､勝手に付けてくれる
    s.img = Rails.root.join("app/assets/images/item_img/sample_#{num1}.jpeg").open
    s.item_id = n
  end
  Image.seed do |s|
    # s.id = 
    s.img = Rails.root.join("app/assets/images/item_img/sample_#{num2}.jpeg").open
    s.item_id = n
  end
  Image.seed do |s|
    # s.id = 
    s.img = Rails.root.join("app/assets/images/item_img/sample_#{num3}.jpeg").open
    s.item_id = n
  end
end

