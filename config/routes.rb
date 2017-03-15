Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "dashboards#index"

  resources :dashboards

  scope :admin, module: "admin" do
    resources :users
    resources :clients
    resources :services
    resources :service_groups
    resources :companies
    get 'import_users/new', to: 'users#import_users_new', as: 'import_users_new'
    post 'import_users', to: 'users#import_users_create', as: 'import_users'
    get 'import_users_poller', to: 'users#import_users_poller', as: 'import_users_poller'
  end

end
