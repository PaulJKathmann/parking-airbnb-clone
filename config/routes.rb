Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/edit'
  get 'spaces/index'
  get 'spaces/show'
  get 'spaces/create'
  get 'spaces/new'
  get 'spaces/destroy'
  get 'spaces/edit'
  get 'spaces/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
