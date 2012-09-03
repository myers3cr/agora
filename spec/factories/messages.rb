FactoryGirl.define do
  factory Message do
    headline "Test message headlibe"
    content "Test message content."
    start_date Time.now - 1.day
    end_date Time.now + 1.day
  end
end