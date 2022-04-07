# frozen_string_literal: true

Rails.application.routes.draw do
  resources :project_masters  do
    resources :tasks  do
      resources :issues
    end
  end
  

  devise_scope :user do
  get '/users/sign_out' ,to: 'devise/sessions#destroy'
  end
  devise_for :users

  root 'home#homepage'
  get '/home', to: 'home#homepage'
  get '/users/:id/edit', to: 'users#editrole'
  put '/project_master/:id', to: 'project_masters#update'
  # delete '/users/:id', to: 'users#destroy'

  authenticate :user, ->(u) { u.has_role? :admin } do
  resources :users
  resources :clients
   get '/project_masters', :to => 'project_masters#index'
   get '/dashboard', to: 'home#dashboard'
  #  delete '/users/:id', to: 'users#destroy'

  end

  authenticate :user, ->(u) { u.has_role? :employee } do
    get '/dashboard', to: 'home#homepage'
  end
  
  get "/members/:id", to: "members#new", as: "members"
  post "/members/:id", to: "members#create", as: "create"
  get "/members/destroy/:id", to: "members#destroy", as: "destroy"
  
  get "/technologies/new", to: "technologies#new", as: "technologies"
  post "/technologies/new", to: "technologies#create", as: "techcreate"
  get "/technologies/:id", to: "technologies#destroy", as: "techdestroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
