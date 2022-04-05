# frozen_string_literal: true

Rails.application.routes.draw do
  resources :project_masters  do
    resources :tasks
  end

  devise_scope :user do
  get '/users/sign_out' ,to: 'devise/sessions#destroy'
  end
  devise_for :users

  root 'home#homepage'
  get '/home', to: 'home#homepage'
  get '/users/:id/edit', to: 'users#editrole'

  authenticate :user, ->(u) { u.has_role? :admin } do
  resources :users
   get '/project_masters', :to => 'project_masters#index'
   get '/dashboard', to: 'home#dashboard'
  end

  authenticate :user, ->(u) { u.has_role? :employee } do
    get '/dashboard', to: 'home#homepage'
  end
  
  get "/members/:id", to: "members#new", as: "members"
  post "/members/:id", to: "members#create", as: "create"
  get "/members/destroy/:id", to: "members#destroy", as: "destroy"  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
