class Assessment < ApplicationRecord
  belongs_to :user

  enum user_rank: {good: 0, nomall: 1, bad: 2}
  enum status: {for_buyer: 0, for_seller: 1}
end
