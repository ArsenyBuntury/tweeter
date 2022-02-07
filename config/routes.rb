Rails.application.routes.draw do
  root 'twits#index', as: 'home'
  get 'about' => 'pages#about'
  get 'contacts' => 'pages#contacts'
  resources :twits do
    resources :comments, only: %i[create destroy]
  end
  # resources :twits
end
