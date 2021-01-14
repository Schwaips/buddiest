Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, except: [:destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]

  get '/dashboard', to: "pages#dashboard"
  #delete offer
  delete 'offers/:id' => 'offers#destroy', as: :destroy


end
