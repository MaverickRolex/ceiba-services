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
  end

end
