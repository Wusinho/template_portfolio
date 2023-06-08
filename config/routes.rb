Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :homepages
  # Defines the root path route ("/")
  root "homepages#index"
end
