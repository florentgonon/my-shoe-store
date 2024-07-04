FactoryBot.define do
  factory :inventory_attributes, class: Hash do
    store { OpenStruct.new(build(:store_attributes)) }
    shoe { OpenStruct.new(build(:shoe_attributes)) }
    stock { SecureRandom.random_number(100) }
    initialize_with { attributes }
  end
end
