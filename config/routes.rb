Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :new, :show] do
    get :buy, on: :member
  end
      # 実装時showのみに変更 productsに入れ子
    resources :categorys, only: [:index,:show]
  
  resources :users do [:user, :show]
    get :logout, on: :collection
    get :identification, on: :collection
  end
  resources :payments, only: [:index, :new]

  devise_scope :user do
    get 'users/sign_up/index' => 'users/registrations#index'
  end
end
