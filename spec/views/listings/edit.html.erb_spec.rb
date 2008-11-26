require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/edit.html.erb" do
  include ListingsHelper
  
  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/listings/edit.html.erb"
    
    response.should have_tag("form[action=#{listing_path(@listing)}][method=post]") do
    end
  end
end


