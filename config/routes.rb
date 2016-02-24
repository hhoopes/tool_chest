Rails.application.routes.draw do
  root to: "tools#index"
  resources :users, only: [:new, :create, :show] do
    resources :tools
    resources :categories, only: [:index, :show]
  end

  namespace "admin" do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end



  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
