require 'spec_helper'

describe Org do

  it "has a valid factory" do
    create(:org).should be_valid
  end
  
  it "is invalid without a name" do
    build(:org, name: nil).should_not be_valid
  end
  
  it "is invalid with a duplicate name" do
    create(:org, name: "Org Name")
    build(:org, name: "Org Name").should_not be_valid
  end
  
  it "is valid with a 32 character name" do
    build(:org, name: "a" * 32).should be_valid
  end  
  
  it "is invalid with a 33 character name" do
    build(:org, name: "a" * 33).should_not be_valid
  end
  
  it "is invalid without a currency" do
    build(:org, currency: nil).should_not be_valid
  end
  
  it "is invalid without an org_type" do
    build(:org, org_type: nil).should_not be_valid
  end
  
end