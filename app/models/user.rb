class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :chats
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end












