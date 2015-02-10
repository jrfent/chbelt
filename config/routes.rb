Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :subcategories
  resources :categories
  resources :products
  devise_for :users
  get "about" => "pages#about"
  get "pinview" => "products#pinview"
  root "products#index"
end
