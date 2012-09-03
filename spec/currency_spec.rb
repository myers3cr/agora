require 'spec_helper'

describe Currency do

  it "has a valid factory" do
    FactoryGirl.create(:currency).should be_valid
  end

end