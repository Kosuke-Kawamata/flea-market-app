100.times do |n|
  array = (1..13).to_a.sample(2)      
  num1 = array[0]
  num2 = array[1]
  
  Assessment.seed do |s|    
    s.id = n+1
    s.user_rank = rand(0..2)
    s.message = "ありがとうございました!#{n+1}個目のメッセージ"
    s.status = rand(0..1)
    s.trading_partner_id = num1
    s.user_id = num2
  end
end