Rails.application.routes.draw do
  root to: "tools#index"
  resources :tools
  resources :users, only: [:new, :create, :show]

  namespace "admin" do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :categories, only: [:index, :show]



  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
