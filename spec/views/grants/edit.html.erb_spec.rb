require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/grants/edit.html.erb" do
  include GrantsHelper
  
  before(:each) do
    assigns[:grant] = @grant = stub_model(Grant,
      :new_record? => false,
      :scope_type => "value for scope_type",
    )
  end

  it "should render edit form" do
    render "/grants/edit.html.erb"
    
    response.should have_tag("form[action=#{grant_path(@grant)}][method=post]") do
      with_tag('input#grant_scope_type[name=?]', "grant[scope_type]")
    end
  end
end


