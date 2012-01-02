require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "message attributes must not be empty" do
    message = Message.new
    assert message.invalid?
    assert message.errors[:headline].any?
    assert message.errors[:content].any?
    assert message.errors[:start_date].any?    
    assert message.errors[:end_date].any?    
  end
  
  test "message headline must be 64 characters or less" do
    message = messages(:current_one)

    #64 characters should pass
    message.headline = "1234567890123456789012345678901234567890123456789012345678901234"
    assert message.save
    assert !message.errors[:headline].any?

    # 65 characters should fail
    message.headline = "12345678901234567890123456789012345678901234567890123456789012345"
    assert !message.save
    assert_equal "is too long (maximum is 64 characters)", message.errors[:headline].join("; ")    
  end

  test "must find current messages" do
    messages = Message.current
    assert_equal 3, messages.size
  end

end
