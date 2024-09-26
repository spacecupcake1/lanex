Rails.application.routes.draw do
  get "activities/index"
  root 'pages#home'
  
  resources :users
  resources :lessons
  resources :activities, only: [:index]
  resources :bookings, only: [:create] do
    get 'confirmation', on: :member
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  get "sessions/index"
  get "sessions/show"
  get "sessions/new"
  get "sessions/create"
  get "sessions/edit"
  get "sessions/update"
  get "sessions/destroy"
  get "pages/home"
  get "bookings/index"
  get "bookings/show"
  get "bookings/new"
  get "bookings/create"
  get "bookings/edit"
  get "bookings/update"
  get "bookings/destroy"
  get "lessons/index"
  get "lessons/show"
  get "lessons/new"
  get "lessons/create"
  get "lessons/edit"
  get "lessons/update"
  get "lessons/destroy"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
