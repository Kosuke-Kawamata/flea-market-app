class Assessment < ApplicationRecord
  belongs_to :user

  enum user_rank: {良い: 0, ふつう: 1, 悪い: 2}
  enum status: {for_buyer: 0, for_seller: 1}
end
