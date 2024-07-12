class Stores::InventoriesController < InventoriesController
  before_action :set_inventories, only: [:index]

  def index
    @inventories.select { |inventory| inventory.store.id == params[:id].to_i }
    @store_name = @inventories.first.store.name
    @shoes_data = @inventories.each_with_object({}) do |inventory, hash|
      hash[inventory.shoe.name.titleize] = inventory.stock
    end
  end
end
