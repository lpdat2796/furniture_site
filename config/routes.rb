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
  end
end
