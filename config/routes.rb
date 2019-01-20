Rails.application.routes.draw do
  resources :projects
  resources :tickets do
    resources :comments
  end
  resources :tags, except: :show

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  root to: "projects#index"
end
