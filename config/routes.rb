Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :widgets
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  resources :users
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
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
end
end
