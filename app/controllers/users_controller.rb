class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    
    @post_images = @user.post_images
  end

  def edit
  end
end
