class Stores::InventoriesController < ApplicationController
  def index
    @inventories = Resources::Stores::Inventory.find(:all, params: { store_id: params[:id] })
  end
end
