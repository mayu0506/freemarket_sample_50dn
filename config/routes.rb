Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks:  "users/omniauth_callbacks"
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products do
    get :buy, on: :member
    get :change, on: :member
    get :search, on: :collection
    patch :status_update, on: :member 
    get :dammy_show, on: :collection
    resources :likes, only: [:create, :destroy]
  end
      # 実装時showのみに変更 productsに入れ子
    resources :categorys, only: [:index,:show]
  
  resources :users do [:user, :show]
    get :logout, on: :collection
    get :identification, on: :collection
    get :list, on: :member
    get :like_history, on: :member
  end
  resources :payments, only: [:show, :new, :create, :edit, :destroy] do
    post :new, to: 'payments#pay', on: :member
    get :complete, on: :collection
  end
  resources :addresses, only: [:new, :edit, :create]
  resources :trades, only: [:update]

  devise_scope :user do
    post 'users/sign_up' => 'users/registrations#new'
    get 'users/sign_up/index' => 'users/registrations#index'
    get 'users/sign_up/complete' => 'users/registrations#complete' 
  end
end
