Rails.application.routes.draw do

  root to: 'items#index'
  
# トップページ・マイページのルーティング 
  # get 'homes/mypage' => 'homes#mypage'
  # get 'homes/like_items' => 'homes#like_items'
  # get 'homes/commented_items' => 'homes#commented_items'
  # get 'homes/pre_published_items' => 'homes#pre_published_items'
  # get 'homes/published_items' => 'homes#published_items'
  # get 'homes/selling_items' => 'homes#selling_items'
  # get 'homes/sold_items' => 'homes#sold_items'
  # get 'homes/buying_items' => 'homes#buying_items'
  # get 'homes/bought_items' => 'homes#bought_items'
  # get 'homes/assessments_list' => 'homes#assessments_list'
  # get 'homes/profile_page' => 'homes#profile_page'
  get 'homes/company_description' => 'homes#company_description'
  
  # ユーザーログイン・サインイン
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users, only:[:edit, :show, :update] do    
    get 'mypage' 
    get 'like_items' 
    get 'commented_items' 
    get 'pre_published_items' 
    get 'published_items' 
    get 'selling_items' 
    get 'sold_items' 
    get 'buying_items' 
    get 'bought_items' 
    get 'following_user'     
    get 'assessments_list' 
    get 'profile_page'     
  end
  resources :relationships, only:[:create, :destroy]
  
  # 管理者のログイン・サインイン
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do 
    resources :users
  end
  resources :admins
  
  # アイテムモデルのCRUDのルーティング
  
  resources :items do 
    member do       
      get :transaction
      get :shipped
      get :stop_publish
      get :restart_publish
    end
    collection do
      get 'search'
    end
    resources :charges, only:[:create]
    resources :chats, only:[:create, :destroy]
    resources :assessments, only:[:create]
    resources :likes, only:[:create, :destroy]
  end



# カテゴリー別に表示するためのルーティング
  get 'categories/:id' => 'categories#show', as: 'category'
  


end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
