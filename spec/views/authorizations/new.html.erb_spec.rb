require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/new.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    assigns[:authorization] = stub_model(Authorization,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/authorizations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", authorizations_path) do
    end
  end
end


