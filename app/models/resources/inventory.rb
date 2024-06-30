module Resources
  class Inventory < ActiveResource::Base
    self.site = "http://localhost:3001/api/v1/"

    schema do
      integer "store_id", "shoe_id", "stock"
    end
  end
end