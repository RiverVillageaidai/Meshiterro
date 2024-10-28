class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post_image
  # uniquenessを指定すると、validatesメソッドの引数であるuser_idカラムの値がすでにテーブルに保存されている値と重複していないかをチェックしてくれる
  # scopeの指定もすることができ、このように記述するとuser_idとpost_image_idのペアに対して、すでに同じ値のペアがテーブルに保存されていないかを判定してくれる。
  validates :user_id, uniqueness: {scope: :post_image_id}

end
