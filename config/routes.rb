Rails.application.routes.draw do


  root to: "front#home"

 

  get "/accounts"     => "custom_accounts#index", as: :all_accounts 
  #get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  
  post "/accounts/new"     => "custom_accounts#create", as: :create_account
  get "/accounts/new"     => "custom_accounts#new", as: :new_account
  get "/account/edit/:uid" => "custom_accounts#edit", as: :edit_my_profile
  get "/account/edit/:uid" => "custom_accounts#edit", as: :edit_account
  #get "/user/edit/:uid" => "users#edit", as: :edit_user
  get "/account/edit/:uid" => "custom_accounts#update", as: :update_account
  patch "/account/edit/:uid" => "custom_accounts#update", as: :udapte_account
  
  #get "/account/edit/:id" => "custom_accounts#edit", as: :edit_account
  #patch "/account/update/:id" => "custom_accounts#update", as: :udapte_account
  delete "/account/destroy/:id" => "custom_accounts#destroy", as: :destroy_account
  get "/account/delete/:id" => "custom_accounts#delete", as: :delete_account


  get "/customer/edit/:uid" => "customers#update", as: :update_customer
  patch "/customer/edit/:uid" => "customers#update", as: :udapte_customer

  get "/taximan/edit/:uid" => "taximen#update", as: :update_taximan
  patch "/taximan/edit/:uid" => "taximen#update", as: :udapte_taximan

  get "customer/my/profile/:uid" => "customers#edit", as: :edit_customer_profile
  get "driver/my/profile/:uid" => "taximen#edit", as: :edit_taximan_profile
 

 
  
  scope "account" do 
    #resources :users 
    #get "profile/:uid" => "profiles#edit", as: :edit_account
  end
  #devise_for :users
  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles do 
    get "delete"
  end

  devise_for :accounts, path: '', controllers: { 
    registrations: "accounts/registrations",
    confirmations: 'accounts/confirmations',
    passwords: "accounts/passwords",
    sessions: "accounts/sessions"
        
    }, 
    path_names: {
        sign_in: 'account/login', 
        sign_out: 'account/logout', 
        password: 'account/secret', 
        confirmation: 'account/verification', 
        unlock: 'account/unblock', 
        registration: 'account/signup', 
        sign_up: '' 
  }

  devise_scope :account do
    #root to: "users/sessions#new"
    authenticated :account do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'accounts/sessions#new', as: :unauthenticated_root
    end
  end
 
  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

  
end
