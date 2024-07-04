Rails.application.routes.draw do
  root "inventories#index"
  resources :inventories, only: [:index, :show]
  put "inventories/", to: "inventories#update", as: "update_inventory"
  scope module: :stores, path: "/stores/:id", as: :store do
    resources :inventories, only: %i[index show]
  end
end
