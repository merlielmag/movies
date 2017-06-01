Rails.application.routes.draw do
  devise_for :users
  get '/index' => 'statics#index', :as => :index
  get '/about' => 'statics#about', :as => :about

  root 'statics#index'

  resources :peliculas



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
