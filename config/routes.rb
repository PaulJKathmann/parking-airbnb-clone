Rails.application.routes.draw do
  resources :spaces do
    resources :bookings, only: [:new, :create, :update, :edit]
  end
  resources :bookings, only: [:index, :show]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
