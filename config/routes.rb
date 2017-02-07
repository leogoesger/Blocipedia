Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'

  devise_for :users
  root 'welcome#index'
  get 'welcome/about'
  
end
