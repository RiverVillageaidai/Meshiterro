class PostImagesController < ApplicationController
  def new
    @post_image =PostImage.new
  end

  def create
    @post_image =PostImage.new(post_image_params)
    # @post_image.user_id,この投稿の user_id としてcurrent_user.id の値を代入する
    # current_user→ deviseヘルパーメソッド　current_user.id と記述することでログインユーザーの id を取得する
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end


  def index
    @post_images = post_image.
  end

  def show
  end
  
  # ストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
