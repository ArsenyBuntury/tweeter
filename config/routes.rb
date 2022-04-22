Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :widgets
  get 'account_activations/edit'

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :users do
      member do
        get :following, :followers
      end
    end
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

    resources :password_resets, only: %i[new create edit update]
    resources :microposts, only: %i[create destroy]
    resources :relationships, only: %i[create destroy]
  end
end
