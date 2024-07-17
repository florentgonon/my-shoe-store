class TransfersController < ApplicationController
  before_action :set_stores, :set_shoes, only: [:new]

  def new
    @transfer = Resources::Transfer.new
  end

  def create
    transfer = Resources::Transfer.new(create_params)
    if transfer.save
      redirect_to inventories_path, notice: "Stock transferred successfully"
    else
      redirect_to inventories_path, flash: { errors: transfer.errors.full_messages }
    end
  end

  private

  def create_params
    params.require(:transfer).permit(:source_store_id, :destination_store_id, :shoe_model_id, :quantity)
  end

  def set_shoes
    @shoes = Resources::Shoe.all
  end

  def set_stores
    @stores = Resources::Store.all
  end
end
