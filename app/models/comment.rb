class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :content, presence: true, length: {maximum: 140} 
  default_scope -> { order(created_at: :desc) }
  self.per_page =3
end
