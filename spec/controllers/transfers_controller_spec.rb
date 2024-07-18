require "rails_helper"

RSpec.describe TransfersController, type: :controller do
  describe "POST #create" do
    let(:valid_attributes) {
      { source_store_id: 1, destination_store_id: 2, shoe_model_id: 1, quantity: 10 }
    }

    let(:invalid_attributes) {
      { source_store_id: nil, destination_store_id: nil, shoe_model_id: nil, quantity: nil }
    }

    context "all is ok" do
      it "return a 200 and redirects to the inventories path with a notice" do
        allow_any_instance_of(Resources::Transfer).to receive(:save).and_return(true)

        post :create, params: { transfer: valid_attributes }

        expect(response).to redirect_to(inventories_path)
        expect(flash[:notice]).to eq("Stock transferred successfully")
      end
    end

    context "when save fails" do
      it "return a 302 and redirects to the inventories path with errors" do
        allow_any_instance_of(Resources::Transfer).to receive(:save).and_return(false)
        allow_any_instance_of(Resources::Transfer).to receive_message_chain(:errors, :full_messages).and_return(["Not enough stock to transfer"])

        post :create, params: { transfer: invalid_attributes }

        expect(response).to redirect_to(inventories_path)
        expect(flash[:errors]).to match_array(["Not enough stock to transfer"])
      end
    end
  end
end