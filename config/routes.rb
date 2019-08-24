Rails.application.routes.draw do
  devise_for :users,:controllers => { 
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :cards do
      member do
        get :pay
      end
    end
    member do
      get :buy
      get :detail
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
    end
  end
  resources :cards do
    member do
      get :card
      get :registrate
    end
  end

  resources :user_informations do
    member do
      get :listing
      get :shipping_edit
      patch :shipping_change
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

  resources :categories do
    member do
      get :middle
      get :small
    end
  end
  resources :guides 
end
