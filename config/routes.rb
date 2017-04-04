Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :links, only: [:index, :create]
  resources :users, only: [:create]
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
