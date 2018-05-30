# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'events#index'

  resources :events, only: %i[create index]
  resources :statuses, only: %i[index]
end
