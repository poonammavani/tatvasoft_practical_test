Rails.application.routes.draw do
  resources :phones
  post "phones/:expected_number", to: "phones#fancy_number"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
