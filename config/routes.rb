Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "dashboards#index"

  resources :dashboards

  scope :admin, module: "admin" do
    resources :users do
      collection { post :import_file }
    end
    resources :clients
    resources :services
    resources :service_groups
    resources :companies
    resources :import_users
    get 'poller/:id', to: 'import_users#poller', as: 'poller'
  end

end
