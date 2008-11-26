require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/show.html.erb" do
  include ListingsHelper
  
  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
    )
  end

  it "should render attributes in <p>" do
    render "/listings/show.html.erb"
  end
end

