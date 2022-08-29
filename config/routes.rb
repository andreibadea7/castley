Rails.application.routes.draw do
  devise_for :users
  root to: "castles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :castles, only: [:index]
  # Defines the root path route ("/")
end
