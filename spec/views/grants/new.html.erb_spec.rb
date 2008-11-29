require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/grants/new.html.erb" do
  include GrantsHelper
  
  before(:each) do
    assigns[:grant] = stub_model(Grant,
      :new_record? => true,
      :scope_type => "value for scope_type",
    )
  end

  it "should render new form" do
    render "/grants/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", grants_path) do
      with_tag("input#grant_scope_type[name=?]", "grant[scope_type]")
    end
  end
end


