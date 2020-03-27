Rails.application.routes.draw do
  resources :questions do
    collection do
      patch :sort
    end
  end

  resources :articles

  get '/users', to: 'users#index'

  root 'homes#index'
end
