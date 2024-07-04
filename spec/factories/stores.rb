FactoryBot.define do
  factory :store_attributes, class: Hash do
    name { ["ALDO Centre Eaton", "ALDO Destiny USA Mall", "ALDO Pheasant Lane Mall", "ALDO Holyoke Mall", "ALDO Maine Mall", "ALDO Crossgates Mall", "ALDO Burlington Mall", "ALDO Solomon Pond Mall", "ALDO Auburn Mall", "ALDO Waterloo Premium Outlets"].sample }
    initialize_with { attributes }
  end
end
  