Rails.application.routes.draw do
  root "inventories#index"
  resources :inventories, only: [:index, :show]
  put "inventories/", to: "inventories#update", as: "update_inventory"
  namespace :stores do
    resources :inventories, only: [:index, :show]
  end
end
