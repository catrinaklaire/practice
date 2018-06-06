class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments
  belongs_to :comment, optional: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end