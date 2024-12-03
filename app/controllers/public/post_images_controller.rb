class Public::PostImagesController < ApplicationController
  def Public::new
    @post_image =PostImage.new
  end

  def create
    @post_image =PostImage.new(post_image_params)
    # @post_image.user_id,この投稿の user_id としてcurrent_user.id の値を代入する
    # current_user→ deviseヘルパーメソッド　current_user.id と記述することでログインユーザーの id を取得する
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end


  def index
    # pageメソッドは、kaminariをインストールしたことで使用できる
    @post_images = PostImage.page(params[:page])

  end
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  # ストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
