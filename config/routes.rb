Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :stoves, only: [:index]
  resources :stoves, only: [:show], as: :stove

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
