Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  get '/index' => 'statics#index', :as => :index
  get '/about' => 'statics#about', :as => :about

  root 'statics#index'

  resources :peliculas



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
