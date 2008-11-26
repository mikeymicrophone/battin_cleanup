require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Meal do
  before(:each) do
    @valid_attributes = {
      :restaurant_id => "1",
      :start_time => Time.now,
      :end_time => Time.now,
      :capacity => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Meal.create!(@valid_attributes)
  end
end
