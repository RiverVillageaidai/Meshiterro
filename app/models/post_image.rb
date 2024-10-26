class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  # belongs_to    アソシエーション
  belongs_to :user
  
  # 投稿画像表示用のメソッド
  def get_image
    # unless ifと逆
    unless image.attached?
      # `Rails.root.join`は、Railsアプリケーションでファイルパスを生成するためのメソッド
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg' )
    end
    image
  end
  
end
