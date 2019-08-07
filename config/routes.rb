Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      get :buy
    end
  end
  resources :users  do
    member do
      get :logout
    end
  end
  resources :user_informations  do
    member do
      get :card
    end
  end
end
