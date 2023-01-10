Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :update, :show] do
    resources :appointments, only:[:index, :create, :show, :update, :destroy]
    post '/new_from_session', to: 'appointments#new_from_session'
  end
  resources :appointments, only:[:index, :update, :destroy]
  resources :sessions, only: [:index, :create, :update, :show, :destroy]
  resources :reviews, only: [:index, :create, :update, :show, :destroy]
  resources :counselor_profiles, only: [:index, :create, :show, :update]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
