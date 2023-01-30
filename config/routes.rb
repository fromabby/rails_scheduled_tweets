# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do

  # GET /route_name in [controller_file_name#method_name]

  get "/about-frontend-thingy", to: "about#index", as: :about

  # alternate to root: get "/"
  root to: "main#index"
end
