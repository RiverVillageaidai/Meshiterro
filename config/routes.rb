Rails.application.routes.draw do

  devise_for :admin,skip:[:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  # /admin/dashboardsにアクセスするとadmin/dashboards_controller.rbのindexアクションを処理
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  scope module: :public do
    devise_for :users
    root 'homes#top'
    get 'homes/about' => 'homes#about' , as: 'about'

    # コントローラの同じ名前のアクションに紐づく形で、ルーティングを自動生成
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      # このような親子関係を、「ネストする」と言うネストしたURLを作成することでparams[:post_image_id]でPostImageのidが取得できる

      # 今まではresourcesでしたが、ここでは、resource 単数形にすると、/:idがURLに含まれなくなります。
      resource :favorite, only: [:create, :destroy]
      # ルーティングpost_image_post_comments
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit , :update]
  end

  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
