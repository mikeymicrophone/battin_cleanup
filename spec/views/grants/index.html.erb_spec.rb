require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/grants/index.html.erb" do
  include GrantsHelper
  
  before(:each) do
    assigns[:grants] = [
      stub_model(Grant,
        :scope_type => "value for scope_type",
      ),
      stub_model(Grant,
        :scope_type => "value for scope_type",
      )
    ]
  end

  it "should render list of grants" do
    render "/grants/index.html.erb"
    response.should have_tag("tr>td", "value for scope_type", 2)
  end
end

