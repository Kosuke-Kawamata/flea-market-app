class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_room
  has_many :chats  , dependent: :destroy
  belongs_to :item
  enum chat_type: [:open_chat, :close_chat]
end
