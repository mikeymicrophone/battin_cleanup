require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Grant do
  before(:each) do
    @valid_attributes = {
      :permission_id => "1",
      :user_id => "1",
      :scope_type => "value for scope_type",
      :scope_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Grant.create!(@valid_attributes)
  end
end
