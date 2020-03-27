Rails.application.routes.draw do
  resources :articles
  get '/users', to: 'users#index'
  root 'homes#index'
end
