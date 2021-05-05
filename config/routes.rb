Rails.application.routes.draw do

  root to: 'items#index'
  
  # 会社概要のルート
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
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
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
