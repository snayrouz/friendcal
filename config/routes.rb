Rails.application.routes.draw do
  root to: 'main#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/twitter', as: :twitter_login
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/:provider/callback', to: 'sessions#create'


  get 'password-reset', to: 'password#index'
  post 'password-reset', to: 'password#new'

  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  resources :users, only: [:new, :create, :edit, :update]
  resources :visitors, only: :index
  resources :events
end
