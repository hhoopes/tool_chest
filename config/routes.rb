Rails.application.routes.draw do
  root to: "tools#index"

  namespace "admin" do
    resources :categories
    resources :tools
  end

  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index, :show]
  resources :tools, only: [:new, :create, :show, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
