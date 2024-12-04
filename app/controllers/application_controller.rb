class ApplicationController < ActionController::Base

  before_action :configure_authentication
 
  private

  # 現在のコントローラーが管理者用かどうかに基づいて適切な認証メソッド（authenticate_user! または authenticate_admin!）を呼び出します。
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end

  # 現在のコントローラーがAdmin名前空間の下にあるかどうかを判定
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  # homes#topが認証が不要かどうかを判定
  def action_is_public?
    controller_name == 'homes' && action_name == 'top'
  end




  # before_actionメソッドは、このコントローラが動作する前に実行される--------------------------------------------------------
  # authenticate_userメソッド(devise側が用意しているメソッド)
  # :authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能
  # exceptは指定したアクションをbefore_actionの対象から外す topを外しているのでログインしていなくてもtopにはアクセスできる
  # unless: :admin_controller? Adminという名前空間内のコントローラー（例: Admin::DashboardControllerなど）ではauthenticate_user!フィルターが適用されなくなる
  # before_action :authenticate_user!, except: [:top], unless: :admin_controller?

  # private

  #  admin_controller?メソッドは、動いているコントローラーがAdminモジュールの下にあれば、true
  # def admin_controller?
    # self.class.module_parent_name == 'Admin'
  # end

end
