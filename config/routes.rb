Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :update]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
