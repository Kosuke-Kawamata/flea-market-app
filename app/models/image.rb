class Image < ApplicationRecord
  belongs_to :item
  validates :img, presence: true
  mount_uploader :img, ItemImageUploader
end
