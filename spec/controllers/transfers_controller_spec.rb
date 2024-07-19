require "rails_helper"

RSpec.describe TransfersController, type: :controller do
  describe "POST #create" do
    context "all is ok" do
      it "return a 200 and redirects to the inventories path with a notice" do
        allow_any_instance_of(Resources::Transfer).to receive(:save).and_return(true)

        post :create, params: { transfer: build(:transfers_attributes, :valid) }

        expect(response).to redirect_to(inventories_path)
        expect(flash[:notice]).to eq("Stock transferred successfully")
      end
    end

    context "when save fails" do
      it "return a 302 and redirects to the inventories path with errors" do
        allow_any_instance_of(Resources::Transfer).to receive(:save).and_return(false)
        allow_any_instance_of(Resources::Transfer).to receive_message_chain(:errors, :full_messages).and_return(["Not enough stock to transfer"])

        post :create, params: { transfer: build(:transfers_attributes, :invalid) }

        expect(response).to redirect_to(inventories_path)
        expect(flash[:errors]).to match_array(["Not enough stock to transfer"])
      end
    end
  end
end