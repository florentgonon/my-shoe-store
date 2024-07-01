class InventoriesController < ApplicationController
  before_action :set_inventories, only: [:index, :update]
  before_action :set_inventory, only: [:update]

  def index
  end

  def update
    @inventory.stock = params[:inventory][:inventory]
    @inventory.save
  end

  private

  def set_inventory
    @inventory = @inventories.find { |inventory| inventory.store.name == params[:inventory][:store] && inventory.shoe.name == params[:inventory][:model] }
  end

  def set_inventories
    @inventories = Resources::Inventory.find(:all)
  end
end
