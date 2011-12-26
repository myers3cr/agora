require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?, "name error"
    assert !user.errors[:org].any?, "org error"
    assert user.errors[:first_name].any?, "first name error"
    assert user.errors[:last_name].any?, "last name error"
    assert user.errors[:email].any?, "email error"
    assert user.errors[:phone].any?, "phone error"
  end
  
  test "user name must be unique" do
    user = User.new(
      name: users(:admin_user).name
    )
    assert !user.save
    assert_equal "has already been taken", user.errors[:name].join('; ')
  end
  
end
