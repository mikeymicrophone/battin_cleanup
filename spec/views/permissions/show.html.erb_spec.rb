require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/permissions/show.html.erb" do
  include PermissionsHelper
  
  before(:each) do
    assigns[:permission] = @permission = stub_model(Permission,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/permissions/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

