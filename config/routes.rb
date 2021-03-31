Rails.application.routes.draw do
  root 'members#index'
  
  resources :friendships, only:[:create]
  resources :members, only: [:index, :show, :new, :create]
end
