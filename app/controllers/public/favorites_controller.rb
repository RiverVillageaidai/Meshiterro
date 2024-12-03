class Public::FavoritesController < ApplicationController
# いいね
  def create
    post_image = PostImage.find(params[:post_image_id])
    # `post_image_id`という属性に`post_image.id`の値をセットしている。
    # 新しく作成する`Favorite`オブジェクトに`post_image`の`id`を紐付けている。
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end
# いいね取り消し
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    # find_by各モデルをid以外の条件で検索するメソッド(idでも検索可能)返ってくる結果は、最初にヒットした1件のみ
    # find_by(post_image_id: post_image.id) →favoritesモデルからpost_image_idが「post_image.id」のデータを取得する
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
