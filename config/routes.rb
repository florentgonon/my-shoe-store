Rails.application.routes.draw do
  root "inventories#index"
  resources :inventories, only: [:index, :show] do
    collection do
      put :update, as: "update"
    end
  end

  resources :transfers, only: [:new, :create]

  scope "/stores/:id", as: :store do
    resources :inventories, only: [:index, :show], module: :stores
  end
end
