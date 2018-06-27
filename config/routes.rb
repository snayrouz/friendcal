Rails.application.routes.draw do
  resources :events
  root 'visitors#index'
end
