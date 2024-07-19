FactoryBot.define do
  factory :transfers_attributes, class: Hash do
    source_store_id {}
    destination_store_id {}
    shoe_model_id {}
    quantity {}
    initialize_with { attributes }

    trait :valid do
      { source_store_id: 1, destination_store_id: 2, shoe_model_id: 1, quantity: 10 }
    end

    trait :invalid do
      { source_store_id: nil, destination_store_id: nil, shoe_model_id: nil, quantity: nil }
    end
  end
end
