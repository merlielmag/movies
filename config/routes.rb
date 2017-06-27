Rails.application.routes.draw do

  # get 'payment_select/select_plan'

  # get 'payment_select/select_monthly_subscription'

  get '/select_plan' => 'payment_select#select_plan', as: :select_plan
  get '/select_monthly_subscription' => 'payment_select#select_monthly_subscription', as: :select_monthly_subscription

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

  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end


  root 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
