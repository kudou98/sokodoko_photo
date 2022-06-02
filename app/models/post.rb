class Post < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  validates :body, presence: true
  validates :post_image, presence: true
  validates :location, presence: true
end
