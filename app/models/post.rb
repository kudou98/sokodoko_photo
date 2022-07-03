class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_one_attached :post_image

  validates :post_image, presence: true
  validates :location, presence: true
  validates :body, presence: true

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_image
   unless post_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   post_image
  end


  def self.search(search)
    if search != nil
      Post.where('location LIKE(?) or body LIKE(?)' , "%#{search}%",  "%#{search}%")
    else
      Post.all
    end
  end



end
