Rails.application.routes.draw do
  root "inventories#index"
  resources :inventories, only: [:index, :show]
  namespace :stores do
    resources :inventories, only: [:index, :show]
  end
end
