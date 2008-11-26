require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/index.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorizations] = [
      stub_model(Authorization,
      ),
      stub_model(Authorization,
      )
    ]
  end

  it "should render list of authorizations" do
    render "/authorizations/index.html.erb"
  end
end

