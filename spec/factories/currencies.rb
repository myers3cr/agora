FactoryGirl.define do
  str = "AAA"
  sequence :iso_code do 
    str.succ!
  end
  factory :currency do
    iso_code
    description "Sample Currency"
  end
end