class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  # belongs_to    アソシエーション
  belongs_to :user
  
end
