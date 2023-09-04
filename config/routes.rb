Rails.application.routes.draw do

  resources :appointments, only: [:show, :index, :create, :update, :destroy ] 
  resources :patients  
  resources :doctors 

  get 'doctors',to: "doctors#index"
  # get 'appointments',to: 'appointments#index'
  post 'appointments',to: 'appointments#create'

  post "/signup", to: "doctors#create" 
  get "/me", to: "doctors#show"
  post "login", to:"sessions#create"
  delete "/logout", to: "sessions#destroy" 

  # resources :patients  
  # resources :doctors   
  # resources :appointments 

  # post "patients", to: "patients#create"
  # post "doctors", to: "doctors#create" 
end
