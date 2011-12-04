require 'test_helper'

class OrgTest < ActiveSupport::TestCase

  test "org attributes must not be empty" do
    org = Org.new
    assert org.invalid?
    assert org.errors[:org_name].any?
    assert org.errors[:org_type_id].any?
    assert org.errors[:currency_id].any?    
  end
  
end
