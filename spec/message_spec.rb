require 'spec_helper'

describe Message do

  it "has a valid factory" do
    create(:message).should be_valid
  end

end