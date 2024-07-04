require "rails_helper"

RSpec.describe InventoriesController, type: :controller do
  describe "GET #index" do
    context "all is ok" do
      it "return a 200 with inventories" do
        allow(Resources::Inventory).to receive(:find).with(:all).and_return([Resources::Inventory.new(build(:inventory_attributes))])
        allow(Resources::Store).to receive(:find).with(:all).and_return([Resources::Store.new(build(:store_attributes))])
        get :index

        expect(response).to have_http_status(:success)
        expect(assigns(:inventories).first).to be_a(Resources::Inventory)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "return a 200 and the requested updated inventory" do
        allow(Resources::Inventory).to receive(:find).with(:all).and_return([Resources::Inventory.new(build(:inventory_attributes))])
        allow(Resources::Store).to receive(:find).with(:all).and_return([Resources::Store.new(build(:store_attributes))])
        inventory = Resources::Inventory.find(:all).first
        allow(inventory).to receive(:save).and_return(true)

        put :update, params: { inventory: { store: inventory.store.name, shoe: inventory.shoe.name, stock: 5 } }

        expect(response).to have_http_status(:ok)
        expect(inventory.stock.to_i).to eq(5)
      end
    end
  end
end