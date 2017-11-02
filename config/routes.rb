# frozen_string_literal: true

Rails.application.routes.draw do
  get '/sample', to: 'home#sample'
  root to: 'home#sample'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :sites, only: [:index, :create, :show]
  end
end
