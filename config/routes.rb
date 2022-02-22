# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :users, only: %i[new create edit update]
    resource :session, only: %i[new create destroy]

    root 'twits#index', as: 'home'
    get 'about' => 'pages#about'
    get 'contacts' => 'pages#contacts'
    resources :twits do
      resources :comments, only: %i[create destroy]
    end

    resources :comments, only: %i[create destroy] do
      resources :subcomments, only: %i[create destroy]
    end

    namespace :admin do
      resources :users, only: %i[index create edit update]
    end
  end
end
