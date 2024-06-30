class InventoriesController < ApplicationController
  def index
    @inventory = Resources::Inventory.find(:all)
  end
end
