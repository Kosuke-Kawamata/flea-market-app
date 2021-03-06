class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_room
  has_many :chats  
  belongs_to :item
end
