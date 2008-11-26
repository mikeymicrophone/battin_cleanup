require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/edit.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorization] = @authorization = stub_model(Authorization,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/authorizations/edit.html.erb"
    
    response.should have_tag("form[action=#{authorization_path(@authorization)}][method=post]") do
    end
  end
end


