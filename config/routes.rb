Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :home, only: [:index]
    resources :lesson_classes, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :lessons, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :lesson_classes, only: [:show] do
    resources :lessons, only: [:show] do
      resources :concluded_lessons, only: [:create, :destroy]
    end
  end

  get '/serviceworker.js', to: 'serviceworker#serviceworker'
  get '/manifest.json', to: 'serviceworker#manifest'
end
