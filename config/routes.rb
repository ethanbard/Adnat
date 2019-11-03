Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :organizations
  resources :users, only: [:index, :create, :new, :edit, :update, :destroy]
  post 'users/login'
  get 'users/password'
  post 'users/reset_password'
  resources :shifts
  root 'users#index'
end
