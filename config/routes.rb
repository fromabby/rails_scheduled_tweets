# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do

  # GET /route_name in [controller_file_name#method_name]

  get "about-frontend-thingy", to: "about#index", as: :about

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  
  delete "logout", to: "sessions#destroy"

  resources :twitter_accounts
  # get "twitter_accounts/:id"
  # delete "twitter_accounts/:id"

  # alternate to root: get "/"
  root to: "main#index"
end
