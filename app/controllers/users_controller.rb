class UsersController < ApplicationController
  # エディット、アップデート前にログインしているユーザー以外の情報は編集できないようにする
  before_action :is_matching_login_user, only: [:edit, :update]

  # プロフィール詳細
  def show

    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  #プロフィール編集
  def edit
    @user = User.find(params[:id])
  end

  # プロフィール更新
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  # ログインしているユーザー以外の情報は編集できないようにする
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
