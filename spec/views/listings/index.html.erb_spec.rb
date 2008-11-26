require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/index.html.erb" do
  include ListingsHelper
  
  before(:each) do
    assigns[:listings] = [
      stub_model(Listing,
      ),
      stub_model(Listing,
      )
    ]
  end

  it "should render list of listings" do
    render "/listings/index.html.erb"
  end
end

