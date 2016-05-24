require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # root 'users#index'
      resources :users, :only => [:index, :show, :new, :create, :update, :destroy]
    end
  end
end
