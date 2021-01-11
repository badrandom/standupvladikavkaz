Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    get 'concert/change'
    get 'admin/change'
    root 'home#index'
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get '/guests/order_form'
    get '/guests/add_to_db'
    get '/concert/change'
  end


end
