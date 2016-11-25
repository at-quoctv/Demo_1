class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  # validates :title, presence: true, length: { maximum: 40,minimum: 3 } 
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 140,minimum: 3 } 
  self.per_page =10

   def self.search(pattern)
    if pattern.blank? 
      all
    else
      where('content or title  LIKE ?', "%#{pattern}%")
    end
  end
end
