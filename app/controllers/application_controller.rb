class ApplicationController < ActionController::Base

  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters,if: :devise_controller?
  
  # after_sign_in_path_forはDeviseが用意しているメソッド サインイン後にどこに遷移するかを設定している
  # 引数resourceはログインを実行したモデルのデータ、今回の場合はログインしたUserのインスタンスが格納されています。
  def after_sign_in_path_for(resource)
    post_images_pa
  end
   # after_sign_out_path_forはDeviseが用意しているメソッド サインアウト後にどこに遷移するかを設定している
  def after_sign_out_path_for(resource)
    about_path
  end

  # privateは記述をしたコントローラ内でしか参照できません。
  # 一方、protectedは呼び出された他のコントローラからも参照することができます。
  protected

  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
