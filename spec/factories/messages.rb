FactoryGirl.define do
  factory :message do
    headline "Test message headline"
    content "Test message content."
    start_date Time.now - 1.day
    end_date Time.now + 1.day

    factory :past_message do
    	start_date Time.now - 1.month
    	end_date Time.now - 1.day
    end

    factory :future_message do
    	start_date Time.now + 1.day
    	end_date Time.now + 1.month
    end
 
  end
end