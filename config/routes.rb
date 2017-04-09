Rails.application.routes.draw do


  resources :genres
  get 'registrations/new'
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
   resource :settings, only: [:edit, :update]
  resources :users, only: [:index, :show, :new]
  root to: 'posts#index'
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
