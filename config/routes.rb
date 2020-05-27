Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :games, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
