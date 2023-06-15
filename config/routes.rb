Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :homepages
  resources :repos, only: [:show]
  # Defines the root path route ("/")
  root "homepages#index"
end
