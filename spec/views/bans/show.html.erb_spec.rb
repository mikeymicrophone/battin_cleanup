require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bans/show.html.erb" do
  include BansHelper
  
  before(:each) do
    assigns[:ban] = @ban = stub_model(Ban,
    )
  end

  it "should render attributes in <p>" do
    render "/bans/show.html.erb"
  end
end

