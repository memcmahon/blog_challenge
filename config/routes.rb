Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create]
  resources :posts, only: [:new]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
end
