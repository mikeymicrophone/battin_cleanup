require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bans/edit.html.erb" do
  include BansHelper
  
  before(:each) do
    assigns[:ban] = @ban = stub_model(Ban,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/bans/edit.html.erb"
    
    response.should have_tag("form[action=#{ban_path(@ban)}][method=post]") do
    end
  end
end


