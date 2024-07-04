class Stores::InventoriesController < ApplicationController
  def index
    @inventories = Resources::Stores::Inventory.find(:all, params: { store_id: params[:id] })
    @store = @inventories.first.store
    @shoes_data = @inventories.map(&:shoe).each_with_object({}) do |shoe, hash|
      hash[shoe.attributes["name"]] = shoe.attributes["stock"]
    end
  end
end
