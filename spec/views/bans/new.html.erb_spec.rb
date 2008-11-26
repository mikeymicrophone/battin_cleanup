require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bans/new.html.erb" do
  include BansHelper
  
  before(:each) do
    assigns[:ban] = stub_model(Ban,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/bans/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", bans_path) do
    end
  end
end


