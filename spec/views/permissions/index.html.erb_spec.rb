require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/permissions/index.html.erb" do
  include PermissionsHelper
  
  before(:each) do
    assigns[:permissions] = [
      stub_model(Permission,
        :name => "value for name"
      ),
      stub_model(Permission,
        :name => "value for name"
      )
    ]
  end

  it "should render list of permissions" do
    render "/permissions/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

