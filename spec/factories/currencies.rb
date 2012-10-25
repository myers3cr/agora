FactoryGirl.define do
  str = "AAA"
  sequence :iso_code do 
    str.succ!
  end
  factory Currency do
    iso_code
    description "Sample Currency"
  end
end