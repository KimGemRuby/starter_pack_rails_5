Rails.application.routes.draw do

  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", :registrations => "registrations" }
  resources :users
  root to: "users#index"
  namespace :admin do
    resources :users
  end

  # Pages
  get "/tuto", to: "pages#tuto"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end