Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'questions#index'

  resources :users
  resources :sessions
  resources :searches
  resources :questions do
    resources :answers
  end

  resources :answers do
    resources :favorites
  end
end
