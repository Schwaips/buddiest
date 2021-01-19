Rails.application.routes.draw do
  # devise_for :users

  # route to correct update
  devise_for :users, :controllers => {:registrations => "users/registrations" }

  root to: 'offers#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, except: [:destroy] do
    resources :bookings, only: [:new, :create, :update]
  end

  #delete offer
  delete 'offers/:id' => 'offers#destroy', as: :destroy

  # bookings show
  resources :bookings, only: [:show]

  #dashboard route
  get '/dashboard', to: "pages#dashboard"

  # route for profile path
  resource :profile, only: [:update]
end
