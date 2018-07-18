Rails.application.routes.draw do
  root to: 'main#index'

  get '/auth/twitter', to: 'sessions#create', as: 'twitter_login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  resources :users, only: [:new, :create, :edit, :update]
  resources :visitors, only: :index
  resources :events
end
