class Stores::InventoriesController < ApplicationController
  def index
    inventories = Resources::Stores::Inventory.all(store_id: params[:store_id])
    @store_name = inventories.first.store.name
    @shoes_data = inventories.each_with_object({}) do |inventory, hash|
      hash[inventory.shoe.name.titleize] = inventory.stock
    end
  end
end
