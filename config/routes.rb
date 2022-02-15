Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  resources :users, only: %i[new create edit update]
  resource :session, only: %i[new create destroy]

  root 'twits#index', as: 'home'
  get 'about' => 'pages#about'
  get 'contacts' => 'pages#contacts'
  resources :twits do
    resources :comments, only: %i[create destroy]
  end

  namespace :admin do
  	resources :users, only: %i[index]
  end
  end
end
