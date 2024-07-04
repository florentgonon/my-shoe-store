FactoryBot.define do
  factory :shoe_attributes, class: Hash do
    name { ["ADERI", "MIRIRA", "CAELAN", "BUTAUD", "SCHOOLER", "SODANO", "MCTYRE", "CADAUDIA", "RASIEN", "WUMA", "GRELIDIEN", "CADEVEN", "SEVIDE", "ELOILLAN", "BEODA", "VENDOGNUS", "ABOEN", "ALALIWEN", "GREG", "BOZZA"].sample }
    initialize_with { attributes }
  end
end
