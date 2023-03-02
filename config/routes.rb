Rails.application.routes.draw do
  resources :offers, only: %i[new show create] do
    resources :bookings, only: %i[create show]
  end
  resources :bookings, only: %i[]  do
    resources :reviews, only: %i[new create]
  end
  # get '/bookings/:booking_id/reviews/new', to: 'reviews#new', as: 'new_review'
  # post '/bookings/:booking_id/reviews/create', to: 'reviews#create'
  devise_for :users
  root to: "offers#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
