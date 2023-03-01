Rails.application.routes.draw do
  resources :offers, only: %i[new show create] do
    resources :bookings, only: %i[create]
  end

  devise_for :users
  root to: "offers#index"
  get 'home', to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
