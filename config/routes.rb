Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
end
