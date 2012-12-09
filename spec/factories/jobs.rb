FactoryGirl.define do
  factory Job do
    job_name "Open Item Job"
    status "New"
    category Job::CATEGORIES[0]
    description "Something or other"
    bid_due Time.now.localtime + 3.days
    delivery_due Time.now.localtime + 2.weeks
  end
end