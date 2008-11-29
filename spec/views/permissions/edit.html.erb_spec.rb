require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/permissions/edit.html.erb" do
  include PermissionsHelper
  
  before(:each) do
    assigns[:permission] = @permission = stub_model(Permission,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/permissions/edit.html.erb"
    
    response.should have_tag("form[action=#{permission_path(@permission)}][method=post]") do
      with_tag('input#permission_name[name=?]', "permission[name]")
    end
  end
end


