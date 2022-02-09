Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
  
  root 'twits#index', as: 'home'
  get 'about' => 'pages#about'
  get 'contacts' => 'pages#contacts'
  resources :twits do
    resources :comments, only: %i[create destroy]
  end

end
