module Resources
  class Transfer < ActiveResource::Base
    self.site = "http://localhost:3001/api/v1/"
  end
end