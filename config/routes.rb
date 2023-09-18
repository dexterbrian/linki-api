Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [ :create, :show]
  resources :links, only: [ :create, :update, :destroy ]
  get "/links", to: "links#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy"
end
