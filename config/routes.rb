Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user, url: '/user' do
    root to: 'home#index'
    resources :categories
    resources :products
    get "/login", to: "sessions#new"
    post '/login', to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/sign_up", to: "registrations#new"
    post '/sign_up', to: "registrations#create"

    resources :accounts do
      get :profile, on: :collection
      post :update_profile, on: :collection
    end

    resources :orders do
      post 'checkout', on: :collection
    end

    resources :carts do
      get 'complete', on: :collection
    end
  end

  namespace :admin, url: '/admin' do
    root to: 'home#index'
    get "/login", to: "sessions#new"
    post '/login', to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :banners
    resources :users
    resources :staffs
    resources :categories
    resources :products
    resources :orders
  end
end
