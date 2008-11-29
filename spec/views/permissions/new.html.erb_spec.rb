require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/permissions/new.html.erb" do
  include PermissionsHelper
  
  before(:each) do
    assigns[:permission] = stub_model(Permission,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/permissions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", permissions_path) do
      with_tag("input#permission_name[name=?]", "permission[name]")
    end
  end
end


