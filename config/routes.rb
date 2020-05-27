Rails.application.routes.draw do
  # get 'companies/index'
  # get 'companies/show'
  # get 'games/index'
  # # get 'games/show'
  # get 'games/:id', to: 'games#show'
  resources :companies, only: [:index, :show]
  resources :games, only: [:index, :show]
end
