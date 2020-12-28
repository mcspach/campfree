Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:index] do
    member do
      get :trips
    end
    member do
      get :sites
    end
  end

  resources :sites do
    resources :trips, only: [:index, :new, :create]
  end

  resources :trips, only: [:edit, :update, :destroy]
end
