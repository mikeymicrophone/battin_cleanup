require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bans/index.html.erb" do
  include BansHelper
  
  before(:each) do
    assigns[:bans] = [
      stub_model(Ban,
      ),
      stub_model(Ban,
      )
    ]
  end

  it "should render list of bans" do
    render "/bans/index.html.erb"
  end
end

