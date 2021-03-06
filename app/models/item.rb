class Item < ApplicationRecord
  has_many :rooms
  has_many :chats
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true

  mount_uploader :img, ImgUploader
end











