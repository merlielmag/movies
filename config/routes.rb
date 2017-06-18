Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  get '/index' => 'statics#index', :as => :index
  get '/about' => 'statics#about', :as => :about

  get 'select_movies/index'

  resources :peliculas
  resources :settings

  resources :select_movies, only: :index

  resources :charges
  resources :payments

  root 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
