require 'spec_helper'

describe Job do

  before(:each) do
    Timecop.return
  end

  it "has a valid factory" do
    FactoryGirl.create(:job).should be_valid
  end

  it "is invalid without a jobname" do
    FactoryGirl.build(:job, jobname: nil).should be_invalid
  end

  it "is invalid without a status" do
    FactoryGirl.build(:job, status: nil).should be_invalid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:job, description: nil).should be_invalid
  end

  it "is invalid without a bid due" do
    FactoryGirl.build(:job, bid_due: nil).should be_invalid
  end
  
  it "is invalid without a delivery due" do
    FactoryGirl.build(:job, delivery_due: nil).should be_invalid
  end

  it "is invalid if bid due is less than 1 hour in the future" do
    Timecop.freeze
    FactoryGirl.build(:job, bid_due: Time.now + 59.minutes + 59.seconds).should be_invalid
  end
  
  it "is valid if bid due is 1 hour in the future" do
    Timecop.freeze
    FactoryGirl.build(:job, bid_due: Time.now + 1.hour).should be_valid
  end

  it "is invalid if delivery due is before bid due" do
    Timecop.freeze
    FactoryGirl.build(:job, bid_due: Time.now + 1.hour, delivery_due: Time.now + 1.hour - 1.second).should be_invalid
  end
  
  it "is valid if delivery due is after bid due" do
    Timecop.freeze
    FactoryGirl.build(:job, bid_due: Time.now + 1.hour, delivery_due: Time.now + 1.hour + 1.second).should be_valid
  end
  
end