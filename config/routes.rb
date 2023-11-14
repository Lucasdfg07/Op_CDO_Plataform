Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :home, only: [:index]
    resources :lesson_classes, only: [:new, :create]
    resources :lessons, only: [:new, :create]
  end

  resources :lesson_classes, only: [:show]
end
