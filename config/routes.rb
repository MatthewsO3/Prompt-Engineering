Rails.application.routes.draw do
  get 'chat_gpt/index'
  resources :bookings
  resources :showings
  resources :seats
  resources :screens
  resources :movies

  devise_for :users
  resources :users
  post '/bookings', to: 'bookings#create'
  get 'home/seats'
  get 'home/info'
  get 'home/pricing'
  get 'devise/new_user_registration'
  get 'home/films'

 root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  
end
