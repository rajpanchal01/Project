# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#homepage'
  get '/home', to: 'home#homepage'
  authenticate :user, ->(u) { u.has_role? :admin } do
    # get 'guide/dashboard', :to => 'guides#dashboard'
    get '/dashboard', to: 'home#dashboard'
  end
  authenticate :user, ->(u) { u.has_role? :employee } do
    get '/dashboard', to: 'home#homepage'
  end
  # get "/dashboard" ,to: "home#dashboard"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
