require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/new.html.erb" do
  include ListingsHelper
  
  before(:each) do
    assigns[:listing] = stub_model(Listing,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/listings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", listings_path) do
    end
  end
end


