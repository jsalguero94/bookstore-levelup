Rails.application.routes.draw do
  resources :requests
  resources :comments
  resources :users
  resources :book_tags
  resources :tags
  resources :categories
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
