Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :links, only: [:index]
  resources :users, only: [:create]
  get '/signup', to: 'users#new', as: 'signup'

  get '/login', to: 'sessions#new', as: 'login'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
