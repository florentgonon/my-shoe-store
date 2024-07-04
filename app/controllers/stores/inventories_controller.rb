class Stores::InventoriesController < ApplicationController
  def index
    inventories = Resources::Stores::Inventory.find(:all, params: { store_id: params[:id] })
    @store_name = inventories.first.store_name
    @shoes_data = inventories.each_with_object({}) do |inventory, hash|
      hash[inventory.shoe_name.titleize] = inventory.stock
    end
  end
end
