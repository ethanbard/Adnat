Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :organizations
  
  resources :users, only: [:index, :create, :new, :edit, :update, :destroy]
  post 'users/login'
  get 'users/logout'
  get 'users/password'
  post 'users/reset_password'
  
  resources :shifts, only: [:index, :create, :edit, :update, :destroy]
  get 'shifts/destroy_all'
  delete 'shifts/destroy_all'

  root 'users#index'
end
