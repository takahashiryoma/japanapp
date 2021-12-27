class Want < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }
end
