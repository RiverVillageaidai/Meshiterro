class ApplicationController < ActionController::Base
  
  # before_actionメソッドは、このコントローラが動作する前に実行される--------------------------------------------------------
  
  # authenticate_userメソッド(devise側が用意しているメソッド)
  # :authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能
  # exceptは指定したアクションをbefore_actionの対象から外す topを外しているのでログインしていなくてもtopにはアクセスできる
  # unless: :admin_controller? Adminという名前空間内のコントローラー（例: Admin::DashboardControllerなど）ではauthenticate_user!フィルターが適用されなくなる
  before_action :authenticate_user!, except: [:top], unless: :admin_controller?
  
  # :devise_contoller?メソッド(devise側が用意しているメソッド)
  # deviseにまつわる画面に行った時に、という意味
  # configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters,if: :devise_controller?

  # after_sign_in_path_forはDeviseが用意しているメソッド サインイン後にどこに遷移するかを設定している
  # 引数resourceはログインを実行したモデルのデータ、今回の場合はログインしたUserのインスタンスが格納されています。
  def after_sign_in_path_for(resource)
    post_images_path
  end
   # after_sign_out_path_forはDeviseが用意しているメソッド サインアウト後にどこに遷移するかを設定している
  def after_sign_out_path_for(resource)
    about_path
  end

  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  # privateは記述をしたコントローラ内でしか参照できません。
  # 一方、protectedは呼び出された他のコントローラからも参照することができます。
  protected

  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
