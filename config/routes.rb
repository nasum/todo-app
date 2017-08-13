Rails.application.routes.draw do
  root to: 'default#index'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/complete', to: 'users#show'

  get '/sign_in', to: 'session#new'
  post '/sign_in', to: 'session#create'
  delete '/sign_out', to: 'session#destroy'

  resources :dashboard, only: [:index]
end
