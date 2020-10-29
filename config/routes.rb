# frozen_string_literal: true

Rails.application.routes.draw do
  resources :uploads
  resources :lines

  resources :customers do
    resources :payments, path: 'reports', as: 'reports'
  end

  root to: 'uploads#new'
end
