# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :requests
  resources :tags
  resources :categories
  resources :books do
    resources :book_comments, only: [:create]
  end
  resources :authors
  get 'commented_books', to: 'book_comments#show_commented_books'
  root 'books#index'
end
