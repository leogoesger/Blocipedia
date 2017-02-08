Rails.application.routes.draw do

  resources :wikiis

  get 'users/new'
  get 'users/create'

  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root 'welcome#index'
  get 'welcome/about'

  resources :charges
  post 'charges/downgrade' => 'charges#downgrade', :as => :downgrade
  
end
