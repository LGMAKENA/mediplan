Rails.application.routes.draw do
  get 'doctors',to: "doctors#index"
  get 'appointments',to: 'appointments#index'
  post 'appointments',to: 'appointments#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
