Rails.application.routes.draw do
  get 'doctors',to: "doctors#index"
  get 'appointments',to: 'appointments#index'
  post 'appointments',to: 'appointments#create'

  resources :patients 

  post "patients", to: "patients#create"
end
