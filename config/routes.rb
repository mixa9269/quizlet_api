# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#create'
      get '/users/current', to: 'users#current'

      post '/signin', to: 'sessions#create'
      delete '/logout', to: 'sessions#logout'

      post '/card_sets', to: 'card_sets#create'
    end
  end
end
