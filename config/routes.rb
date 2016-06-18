require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      root 'decks#index'
      get    'signup'  => 'users#new'
      get    'login'   => 'sessions#new'
      post   'login'   => 'sessions#create'
      delete 'logout'  => 'sessions#destroy'
      resources :users, only: [:index, :show, :new, :create, :update, :destroy] do
        resources :decks, only: [:create, :update, :destroy]
      end
      resources :decks, only: [:index, :show, :new]
      resources :sessions, only: [:create, :destroy]
      resources :cards, only: [:index, :show]
    end
  end
end
