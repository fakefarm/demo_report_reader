# frozen_string_literal: true

Rails.application.routes.draw do
  resources :searches, only: %i[index new create]
  resources :uploads, only: %i[create new]

  resources :customers, only: %i[index show] do
    resources :payments, path: 'reports', as: 'reports', only: %i[show]
  end

  root to: 'uploads#new'
end
