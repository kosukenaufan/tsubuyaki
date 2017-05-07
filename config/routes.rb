Rails.application.routes.draw do



  get 'static_pages/about'

  get 'static_pages/privacy'

  get 'static_pages/agreement'

  get 'static_pages/organization'

  delete 'users', to: 'users#destroy'

  resources :users do
    member do
      get :activate
    end
  end

    get 'registrations/new'
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]
  resources :users, only: [:index, :show, :new]
  root to: 'posts#index'
  resources :users
  resources :posts
  resources :genres
  get 'attensions', to:'attensions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
