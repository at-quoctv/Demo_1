class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  # validates :title, presence: true, length: { maximum: 40,minimum: 3 } 
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 140,minimum: 3 } 
  self.per_page =10
end
