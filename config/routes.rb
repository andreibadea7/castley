Rails.application.routes.draw do
  devise_for :users
  root to: "castles#home_page"
  resources :castles, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:create]
  end
  get :my_profile, to: 'users#show'

  resources :reservations, only: [] do
    resources :reviews, only: [:new, :create]
  end
end
