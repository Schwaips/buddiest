Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers

  # # CREATE
  # get 'offers/new' => 'offers#new'
  # post 'offers' => "offers#create"

  #delete offer
  delete 'offers/:id' => 'offers#destroy', as: :destroy

  # update offer
  # get 'offers/:id/edit' => 'offers#edit', as: :edit
  # patch 'offers/:id' => 'offers#update'
end
