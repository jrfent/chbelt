Rails.application.routes.draw do
  resources :subcategories

  resources :categories

  resources :products

  devise_for :users
  get "about" => "pages#about"
  root "products#index"

end
