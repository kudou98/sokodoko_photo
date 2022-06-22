class Tag < ApplicationRecord
  validates :tags_name, presence: true, length: { maximum:99}

  has_many :post_tags,dependent: :destroy
  has_many :posts, through: :post_tags
  validates :tag_name, uniqueness: true


  def self.search(search)
    if search != '#'
      tag = Tag.where(tag_name: search)
      #tag[0].posts
    else
      Post.all
    end
  end


end
