Rails.application.routes.draw do
  root 'twits#index'
  get 'about'=>'pages#about'
  get 'contacts'=>'pages#contacts'
  

  resources :twits
end
