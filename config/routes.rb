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
    resources :orders do
      get 'rejected_orders', on: :collection
      get 'rejected_orders/:id', to: 'orders#rejected_order_detail', as: 'rejected_order_detail', on: :collection
      get 'shipments', on: :collection
      get 'shipments/:id', to: 'orders#shipment_detail', as: 'shipment_detail', on: :collection
      post 'shipments', to: 'orders#shipment_detail_update', as: 'shipment_detail_update', on: :collection
      get 'completed_orders', on: :collection
      get 'completed_orders/:id', to: 'orders#completed_order_detail', as: 'completed_order_detail', on: :collection
    end
  end
end
