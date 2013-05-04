# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :open_item do
    quantity 1
    category "MyString"
    description "MyString"
  end
end
