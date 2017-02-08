Rails.application.routes.draw do

  get 'charges/new'

  get 'charges/create'

  resources :wikiis

  get 'users/new'
  get 'users/create'

  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root 'welcome#index'
  get 'welcome/about'

  resources :charges, only: [:new, :create]
  
end
