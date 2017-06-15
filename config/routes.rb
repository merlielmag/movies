Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  get '/index' => 'statics#index', :as => :index
  get '/about' => 'statics#about', :as => :about

  resources :peliculas
  resources :settings

  resources :charges

  root 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
