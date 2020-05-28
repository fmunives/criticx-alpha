Rails.application.routes.draw do
  #routes for users
  resources :users, only: [:new, :create]
  
  #routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session', to: 'sessions#destroy'

  #routes for games and companies
  resources :companies, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :games, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
