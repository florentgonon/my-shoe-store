module Resources
  module Stores
    class Inventory < Resources::Inventory
      self.site += "stores/:store_id/"
      self.element_name = "inventory"

      schema do
        integer "store_id", "shoe_id", "stock"
      end
    end
  end
end