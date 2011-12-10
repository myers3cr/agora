require 'test_helper'

class OrgTest < ActiveSupport::TestCase

  test "org attributes must not be empty" do
    org = Org.new
    assert org.invalid?
    assert org.errors[:name].any?
    assert org.errors[:org_type_id].any?
    assert org.errors[:currency_id].any?    
  end
  
  test "org name must be unique" do
    org = Org.new(
      name: orgs(:buyer_org).name
    )
    assert !org.save
    assert_equal "has already been taken", org.errors[:name].join('; ')
  end
  
  test "org name must be shorter than 32 characters" do
    org = orgs(:buyer_org)
    org.name = "123456789012345678901234567890123"

    assert !org.save
    assert_equal "is too long (maximum is 32 characters)", org.errors[:name].join("; ")
    
    org.name = "12345678901234567890123456789012"
    assert org.save
    assert !org.errors[:name].any?
  end

end
