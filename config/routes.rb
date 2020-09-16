Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "books#top"
  get "home/about" => "books#about"
  get "books" => "users#list"
  resources :books, except: [:index]
  resources :users, only: [:show, :edit, :update, :index]
end
