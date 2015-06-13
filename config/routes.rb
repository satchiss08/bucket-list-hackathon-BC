Rails.application.routes.draw do
  root 'home#index'

  resources :bucket_list, only: [:index]
end
