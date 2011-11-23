require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  fixtures :currencies
  
  test "currency attributes must not be empty" do
    currency = Currency.new
    assert currency.invalid?
    assert currency.errors[:iso_code].any?
    assert currency.errors[:description].any?    
  end
  
  test "currency iso code must be 3 characters" do
    # "three shall be the number of the counting, no more, no less"
    currency = Currency.new(
      iso_code: "AB",
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "must be 3 characters", currency.errors[:iso_code].join('; ')
    
    currency.iso_code = "ABCD"
    assert !currency.save
    assert_equal "must be 3 characters", currency.errors[:iso_code].join('; ')
   
   currency.iso_code = "ABC"
   assert currency.save
   assert !currency.errors[:iso_code].any? 
  end
  
  test "currency iso code must be unique" do
    currency = Currency.new(
      iso_code: currencies(:foo).iso_code,
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "has already been taken", currency.errors[:iso_code].join('; ')
  end
  
  test "currency description must be shorter than 32 characters" do
    currency = Currency.new(
      iso_code: "ABC",
      description: "123456789012345678901234567890123"
    )
    assert !currency.save
    assert_equal "is too long (maximum is 32 characters)", currency.errors[:description].join("; ")
    
    currency.description = "12345678901234567890123456789012"
    assert currency.save
    assert !currency.errors[:description].any?
  end
  
end
