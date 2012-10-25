require 'spec_helper'

describe Currency do

  it "has a valid factory" do
    create(:currency).should be_valid
  end
  
  it "is invalid without an ISO code" do
    build(:currency, iso_code: nil).should_not be_valid
  end
  
  it "is invalid without a description" do
    build(:currency, description: nil).should_not be_valid
  end
  
  it "is invalid with numbers for ISO code" do
    build(:currency, iso_code: "123").should_not be_valid
  end
  
  it "is invalid with special characters for ISO code" do
    build(:currency, iso_code: "$@*").should_not be_valid
  end

  it "is invalid with 2 letters for ISO code" do
    build(:currency, iso_code: "ab").should_not be_valid
  end

  it "is valid with 3 letters for ISO code" do
    build(:currency, iso_code: "abc").should be_valid
  end
  
  it "is invalid with 4 letters for ISO code" do
    build(:currency, iso_code: "abcd").should_not be_valid
  end
  
  it "is invalid with a duplicate ISO code" do
    create(:currency, iso_code: 'abc')
    build(:currency, iso_code: 'abc').should_not be_valid
  end
    
  it "is valid with a 32 character description" do
    build(:currency, description: "a" * 32).should be_valid
  end
  
  it "is invalid with a 33 character description" do
      build(:currency, description: "a" * 33).should_not be_valid
  end
  
  it "converts lowercase ISO to uppercase when saved" do
    f = create(:currency, iso_code: "abc")
    f.iso_code.should == "ABC"
  end

end