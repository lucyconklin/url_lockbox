Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :links, only: [:index]
  # resources :users, only: [:new]
  get '/login', to: 'sessions#new', as: 'login'
  get '/signup', to: 'sessions#new', as: 'signup'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
