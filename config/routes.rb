Rails.application.routes.draw do
  resources :attr2s
  resources :attr1s
  resources :enrollments
  resources :attendances
  resources :clients
  resources :offices
  resources :rooms
  resources :courses
  resources :events
  resources :attendance_rates
  
  resources :tenants do
    resources :courses
  end
  resources :members
  get 'home/index'

   root :to => "home#index"

    
  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do   
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => { 
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions", 
    :passwords => "milia/passwords", 
  }


end