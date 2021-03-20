Rails.application.routes.draw do

  root to: 'items#index'
  
# トップページ・マイページのルーティング 
  get 'homes/mypage' => 'homes#mypage'
  get 'homes/company_description' => 'homes#company_description'
# ユーザーログイン・サインイン
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users, only:[:edit, :show, :update] do
    resources :relationships, only:[:create, :destroy]
    
  end
  
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
