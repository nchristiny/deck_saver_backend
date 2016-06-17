FactoryGirl.define do
  factory :card do
    cardId { FFaker::Food.vegetable }
    name { FFaker::Name.first_name }
  end
end
