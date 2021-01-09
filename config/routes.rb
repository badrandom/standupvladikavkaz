Rails.application.routes.draw do
  get 'admin/change'
  root 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/guests/order_form'
  get '/guests/add_to_db'
  get '/home/change'

end
