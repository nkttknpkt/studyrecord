Rails.application.routes.draw do
  root to: 'learns#index'
  
  resources :learns,except: [:show]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
end
