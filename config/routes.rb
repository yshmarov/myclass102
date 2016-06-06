Rails.application.routes.draw do

  resources :tenants
  resources :courses do
    member do
      #get :edit_clean
      #put :update_clean
      get 'edit_events'
      get 'edit_attendances'
      #put 'update_course'
    end
  end
  resources :enrollments
  resources :events
  resources :attendances

  resources :expences
  resources :payments

  resources :attr3s
  resources :attr2s
  resources :attr1s

  resources :members
  resources :clients

  resources :attendance_rates

  resources :product_types
  resources :products

  resources :offices
  resources :rooms

  get 'home/index'
  get 'dashboard', to: 'home#dashboard'
  get 'settings', to: 'home#settings'
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