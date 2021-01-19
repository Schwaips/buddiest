Rails.application.routes.draw do
  # devise_for :users

  # route to correct update
  devise_for :users, :controllers => {:registrations => "users/registrations" }

  root to: 'offers#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, except: [:destroy] do
    resources :bookings, only: [:new, :create]
  end


  #delete offer
  delete 'offers/:id' => 'offers#destroy', as: :destroy

  # bookings show @  update
  resources :bookings, only: [:show]
  patch 'bookings/:id/validate', to: "bookings#validate", as: :validate
  patch 'bookings/:id/refused', to: "bookings#refused", as: :refused

  #dashboard route
  get '/dashboard', to: "pages#dashboard"

  # route for profile path
  resource :profile, only: [:update]
end
