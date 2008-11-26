require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Listing do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :list_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Listing.create!(@valid_attributes)
  end
end
