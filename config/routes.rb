Newapp::Application.routes.draw do

  get '/about' => 'home#about', :as => :about
  get '/contact' => 'home#contact', :as => :contact

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }
  get '/settings' => 'users#settings', :as => :settings

  resources :apps # TODO break apart and use /:id/:action routes
  get '/:id' => 'apps#show', :as => :app

  # root :to => 'home#frontpage'
  root :to => 'apps#index'

end
