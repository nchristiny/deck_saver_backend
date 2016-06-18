FactoryGirl.define do
  factory :deck do
    title { FFaker::Product.product_name }
    user
  end
end
