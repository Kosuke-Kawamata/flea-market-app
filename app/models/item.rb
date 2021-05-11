class Item < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :images, dependent: :destroy
  
  has_many :likes, dependent: :destroy

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_way

  accepts_nested_attributes_for :images, allow_destroy: true

  enum status: {published: 0, in_process: 1, shipped: 2, buyer_assessed: 3, seller_assessed: 4, pre_published: 5}
  enum shipping_fee: {seller_pay: 1, buyer_pay: 2}
  enum shipping_date: {days1_2: 1, days2_3: 2, days4_7: 3}

  validates :name, presence: true, length: { in: 1..25}
  validates :description, presence: true
  # validates :img, presence: true ← カラムを削除した際にはバリデーションも削除すること！
  validates :category_id, presence: true
  validates :price, presence: true, length: { in: 1..7 }  
  validates :item_condition_id, presence: true
  validates :shipping_date, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_way, presence: true
  validates :prefecture_id, presence: true


  def liked_by?(user)
    self.likes.where(user_id: user.id).exists?
  end
end











