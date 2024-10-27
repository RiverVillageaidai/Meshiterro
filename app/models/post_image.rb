class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  # belongs_to    アソシエーション
  belongs_to :user
  # has_many アソシエーション　dependent: :destroy 1:Nの1側が削除されたとき、N側を全て削除する
  has_many :post_comments, dependent: :destroy

  
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
