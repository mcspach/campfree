Rails.application.routes.draw do
  devise_for :users
  root to: 'tents#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:index] do
    member do
      get :bookings
    end
    member do
      get :tents
    end
  end

  resources :tents do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy]
end
