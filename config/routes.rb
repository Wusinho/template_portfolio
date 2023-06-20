Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :homepages
  get 'repo', to: 'repos#repo'
  resources :repos, only: [:create]
  resources :scrapper, only: [:index]
  resources :homepages, only: [:index]
  # Defines the root path route ("/")
  root "homepages#index"
end
