Rails.application.routes.draw do
  devise_for :users
  root to: "castles#home_page"
  resources :castles, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:new, :create]
  end
  get :my_profile, to: 'users#show'
end
