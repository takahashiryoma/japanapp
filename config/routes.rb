Rails.application.routes.draw do
  get 'wants/index'
  get 'wants/show'
  get 'wants/new'
  get 'wants/create'
  get 'wants/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  resources :wants
  resources :prefecture
end
