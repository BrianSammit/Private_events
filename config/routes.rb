Rails.application.routes.draw do
  resources :events
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :attendances, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end
