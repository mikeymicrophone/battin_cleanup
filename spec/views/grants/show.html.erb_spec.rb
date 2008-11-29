require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/grants/show.html.erb" do
  include GrantsHelper
  
  before(:each) do
    assigns[:grant] = @grant = stub_model(Grant,
      :scope_type => "value for scope_type",
    )
  end

  it "should render attributes in <p>" do
    render "/grants/show.html.erb"
    response.should have_text(/value\ for\ scope_type/)
  end
end

