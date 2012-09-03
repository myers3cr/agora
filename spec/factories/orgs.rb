FactoryGirl.define do
  factory Org do
    factory :buyer_org do
      name "buyer_#{num}"
      org_type "buyer"
      currency
    end
  end
end