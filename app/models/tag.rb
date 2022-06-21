class Tag < ApplicationRecord
  validates :tags_name, presence: true, length: { maximum:99}

  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :post_tags
  validates :tag_name, uniqueness: true
end
