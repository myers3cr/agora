require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
  end

  test "job attributes must not be empty" do
    job = Job.new
    assert job.invalid?
    assert job.errors[:job_name].any?
    assert job.errors[:description].any?
    assert job.errors[:bid_due].any?
    assert job.errors[:delivery_due].any?
  end
  
  test "jobname must be less than 60 characters" do
  end
  
end
