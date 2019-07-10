Rails.application.routes.draw do
  resources :spaces
  resources :bookings, only: [:index, :show, :new, :create, :update, :edit]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
