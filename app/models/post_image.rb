class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  # belongs_to    アソシエーション
  belongs_to :user
  
  # 画像表示用のメソッド
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
end
