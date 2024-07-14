class InventoriesController < ApplicationController
  before_action :set_inventories, :set_stores, only: [:index, :update]
  before_action :set_inventory, only: [:update]

  def index
  end

  def update
    @inventory.stock = params[:inventory][:stock]
    @inventory.save
    render json: @inventory
  end

  private

  def set_inventory
    @inventory = @inventories.find { |inventory| inventory.store.name == params[:inventory][:store] && inventory.shoe.name == params[:inventory][:shoe] }
  end

  def set_inventories
    @inventories = Rails.cache.fetch("inventories", expires_in: 12.hours) do
      ::Resources::Inventory.all
    end
  end

  def set_stores
    @stores = Resources::Store.all
  end
end
