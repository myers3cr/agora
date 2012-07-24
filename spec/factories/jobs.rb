FactoryGirl.define do
  factory Job do
    jobname "Open Item Job"
    status "New"
    description "Something or other"
    bid_due Time.now + 1.day
    delivery_due Time.now + 2.days
  end
end