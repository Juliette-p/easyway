Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :activities do
    resources :ratings, only: %i[new create]
    resources :favourites, only: %i[create]
  end
  resources :favourites, only: %i[index]

  resources :users, only: %i[show edit update]

  namespace :user do
    resources :agendas, only: ["create"]
  end

  get '/faq', to: "pages#faq"

  # Defines the root path route ("/")
  # root "posts#index"
end
