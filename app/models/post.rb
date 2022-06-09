class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image

  validates :post_image, presence: true
  validates :location, presence: true
  validates :body, presence: true

  def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
  end


  def get_image
   unless post_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   post_image
  end

end
