Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  # コントローラの同じ名前のアクションに紐づく形で、ルーティングを自動生成
  resources :post_images, only: [:new, :create, :index, :show]
  
  
  get 'homes/about' => 'homes#about' , as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
