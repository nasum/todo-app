Rails.application.routes.draw do
  root to: 'default#index'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/complete', to: 'users#show'
end
