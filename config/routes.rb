Rails.application.routes.draw do
  root to: 'studyrecords#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
end
