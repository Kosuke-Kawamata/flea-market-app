class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :item
end
