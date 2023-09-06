Rails.application.routes.draw do
  resources :appointments, only: [:show, :index, :create, :update, :destroy]
  resources :patients
  resources :doctors

  # get 'doctors',to: "doctors#index"
  # # get 'appointments',to: 'appointments#index'
  # post 'appointments',to: 'appointments#create'

  post "/signup", to: "patients#create"
  get "/me", to: "doctors#show"
  get "/mepatient", to: "patients#show"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "loginDoc", to: "doctor_sessions#create"
  delete "/logoutDoc", to: "doctor_sessions#destroy"

  # post "patients", to: "patients#create"
  # post "doctors", to: "doctors#create"
end
