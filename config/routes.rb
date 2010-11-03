Katalog::Application.routes.draw do |map|
  resources :thing_lists

  resources :departments

  devise_for :users,
    :path_names => { :sign_up => 'register', :sign_in => 'log_in' },
    :controllers => { :registrations => "users/registrations" }
  
  resources :things, :people, :groups, :kontexts, :study_modules
  
  match '/:id', :to => 'things#show'
  
  root :to => "things#index"
end
