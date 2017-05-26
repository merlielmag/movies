Rails.application.routes.draw do
  devise_for :users
  get '/about' => 'statics#about', :as => :about

  root 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
