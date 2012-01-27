require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:username].any?, "name error"
    assert user.errors[:org_id].any?, "org error"
    assert user.errors[:first_name].any?, "first name error"
    assert user.errors[:last_name].any?, "last name error"
    assert user.errors[:email].any?, "email error"
    assert user.errors[:phone].any?, "phone error"
  end
  
  test "user name must be unique" do
    user = User.new(
      username: users(:admin_user).username
    )
    assert !user.save
    assert_equal "has already been taken", user.errors[:username].join('; ')
  end
  
end
