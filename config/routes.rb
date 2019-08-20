Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      get :buy
    end
    collection do
      get :search
      get :search_another
      get :category
      get :category_middle
    end
  end
  resources :users  do
    member do
      get :logout
      get :add_card
    end
  end
  resources :user_informations  do
    member do
      get :card
    end
  end
  resource :user_sign_ups do
    collection do
      get :tell
      get :auth_tell
      get :shipping
      get :card   
      post :post_controll  
    end
  end
end
