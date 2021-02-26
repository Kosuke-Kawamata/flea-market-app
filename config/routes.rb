Rails.application.routes.draw do

  root to: 'items#index'
  
# トップページ・マイページのルーティング
  get 'homes/top' => 'homes#top'
  get 'homes/mypage' => 'homes#mypage'
  get 'homes/company_description' => 'homes#company_description'
  
# ユーザーログイン・サインイン
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users
  
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
    collection do       
      get 'items/transaction', to: "items#transaction"
    end
    resources :charges do 
      collection do
        post "items/:id/charge", to: "charges#create", as: "charge"        
      end
    end
  end

# カテゴリー別に表示するためのルーティング
  get 'categories/:id' => 'categories#show', as: 'category'
  
# CarrierWaveの画像を削除するためのルーティング（途中）
  # get 'item/:id/delete_img/' => 'item#delete_img', as: 'delete_img'

  
  # strip決済サービスのルーティング

# 決済後の取引画面へのルーティング
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
