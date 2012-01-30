require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

  def setup
  end

  test "currency attributes must not be empty" do
    currency = Currency.new
    assert currency.invalid?
    assert currency.errors[:iso_code].any?
    assert currency.errors[:description].any?    
  end

  test "3 uppercase letters should pass" do
    # "three shall be the number of the counting, no more, no less"
    currency = Currency.new(
      iso_code: "ABC",
      description: "New Currency"
    )
    assert currency.save #happy path
    assert !currency.errors[:iso_code].any?
  end

  test "3 lowercase letters should pass" do
    # model automatically converts iso code to uppercase, so lowercase should work
    currency = Currency.new(
      iso_code: "abc",
      description: "New Currency"
    )
    assert currency.save
    assert !currency.errors[:iso_code].any?
  end

  test "two letters should fail" do
    currency = Currency.new(
      iso_code: "AB",
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "must be 3 uppercase letters", currency.errors[:iso_code].join('; ')
  end

  test "four letters should fail" do
    currency = Currency.new(
      iso_code: "ABCD",
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "must be 3 uppercase letters", currency.errors[:iso_code].join('; ')
  end

  test "three numbers should fail" do
    currency = Currency.new(
      iso_code: "123",
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "must be 3 uppercase letters", currency.errors[:iso_code].join('; ')
  end

  test "special characters should fail" do
    currency = Currency.new(
      iso_code: "*%*",
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "must be 3 uppercase letters", currency.errors[:iso_code].join('; ')
  end

  test "currency iso code must be unique" do
    currency = Currency.new(
      iso_code: currencies(:dollar).iso_code,
      description: "New Currency"
    )
    assert !currency.save
    assert_equal "has already been taken", currency.errors[:iso_code].join('; ')
  end

  test "description of 32 characters should pass" do
    currency = Currency.new(
      iso_code: "ABC",
      description: "12345678901234567890123456789012"
    )
    assert currency.save
    assert !currency.errors[:description].any?
  end

  test "description longer than 32 characters should fail" do
    currency = Currency.new(
      iso_code: "ABC",
      description: "123456789012345678901234567890123"
    )
    assert !currency.save
    assert_equal "is too long (maximum is 32 characters)", currency.errors[:description].join("; ")
  end

end