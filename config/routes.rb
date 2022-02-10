Rails.application.routes.draw do
  resources :users, only: %i[new create edit update]
  resource :session, only: [:new, :create, :destroy]
  
  root 'twits#index', as: 'home'
  get 'about' => 'pages#about'
  get 'contacts' => 'pages#contacts'
  resources :twits do
    resources :comments, only: %i[create destroy]
  end

end
