Rails.application.routes.draw do
  root 'home#index'

  resources :activities, only: [:index, :show, :create, :update, :destroy]
end
