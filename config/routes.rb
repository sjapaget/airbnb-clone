Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bicycles
  resources :bookings, only: %I[index new create edit update destroy]
  resources :reservations, only: %I[index]
end
