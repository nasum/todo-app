Rails.application.routes.draw do
  root to: 'default#index'
  resources :users, except: [:index]
end
