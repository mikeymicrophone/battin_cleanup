require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Restaurant do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :phone => "value for phone",
      :email => "value for email",
      :user_id => "1",
      :address => "value for address",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip"
    }
  end

  it "should create a new instance given valid attributes" do
    Restaurant.create!(@valid_attributes)
  end
end
