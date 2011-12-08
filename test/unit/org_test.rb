require 'test_helper'

class OrgTest < ActiveSupport::TestCase

  test "org attributes must not be empty" do
    org = Org.new
    assert org.invalid?
    assert org.errors[:org_name].any?
    assert org.errors[:org_type_id].any?
    assert org.errors[:currency_id].any?    
  end
  
  test "org name must be unique" do
    org = Org.new(
      org_name: orgs(:buyer_org).org_name
    )
    assert !org.save
    assert_equal "has already been taken", org.errors[:org_name].join('; ')
  end
  
  test "org name must be shorter than 32 characters" do
    org = orgs(:buyer_org)
    org.org_name = "123456789012345678901234567890123"

    assert !org.save
    assert_equal "is too long (maximum is 32 characters)", org.errors[:org_name].join("; ")
    
    org.org_name = "12345678901234567890123456789012"
    assert org.save
    assert !org.errors[:org_name].any?
  end

end
