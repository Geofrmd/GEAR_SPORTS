Rails.application.routes.draw do
  resources :offers, only: %i[new show create] do
    resources :bookings, only: %i[create show new]
  end

  devise_for :users
  root to: "offers#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
