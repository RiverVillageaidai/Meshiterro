class UsersController < ApplicationController
  # プロフィール詳細
  def show
    @user = User.find(current_user.id)
    @post_images = @user.post_images
  end

  #プロフィール編集
  def edit
    @user = User.find(current_user.id)
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

end