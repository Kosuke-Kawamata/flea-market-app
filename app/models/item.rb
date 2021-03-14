class Item < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  belongs_to :user
  belongs_to :category

  enum status: {published: 0, in_process: 1, shipped: 2, buyer_assessed: 3, seller_assessed: 4}

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true

  mount_uploader :img, ImgUploader
end











