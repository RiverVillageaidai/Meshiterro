# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # :devise_controller?メソッド(devise側が用意しているメソッド)
  # deviseにまつわる画面に行った時に、という意味
  # configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters,if: :devise_controller?

  # before_action :configure_sign_in_params, only: [:create]

  # after_sign_in_path_forはDeviseが用意しているメソッド サインイン後にどこに遷移するかを設定している
  # 引数resourceはログインを実行したモデルのデータ、今回の場合はログインしたUserのインスタンスが格納されています。
  def after_sign_in_path_for(resource)
    post_images_path
  end
   # after_sign_out_path_forはDeviseが用意しているメソッド サインアウト後にどこに遷移するかを設定している
  def after_sign_out_path_for(resource)
    about_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # privateは記述をしたコントローラ内でしか参照できません。
  # 一方、protectedは呼び出された他のコントローラからも参照することができます。
  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
