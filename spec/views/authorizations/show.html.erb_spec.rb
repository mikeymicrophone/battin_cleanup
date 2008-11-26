require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/show.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorization] = @authorization = stub_model(Authorization,
    )
  end

  it "should render attributes in <p>" do
    render "/authorizations/show.html.erb"
  end
end

