class Stores::InventoriesController < ApplicationController
  def index
    @inventory = Resources::Stores::Inventory.find(:all, params: { store_id: params[:store_id] })
  end

  def show
    @inventory = Resources::Stores::Inventory.find(params[:id], params: { store_id: params[:store_id] })
  end
end
