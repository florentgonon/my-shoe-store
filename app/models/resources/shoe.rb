module Resources
  class Shoe < ActiveResource::Base
    self.site = "http://localhost:3001/api/v1/"

    schema do
      integer "name"
    end
  end
end