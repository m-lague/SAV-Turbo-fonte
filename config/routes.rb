Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get 'stoves' , to: 'stoves#index'
  resources :stoves, only: [:show], as: :stove do
    resources :diagnostics, only: [:index, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
