require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/restaurants/index.html.erb" do
  include RestaurantsHelper
  
  before(:each) do
    assigns[:restaurants] = [
      stub_model(Restaurant,
        :name => "value for name",
        :phone => "value for phone",
        :email => "value for email",
        :address => "value for address",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip"
      ),
      stub_model(Restaurant,
        :name => "value for name",
        :phone => "value for phone",
        :email => "value for email",
        :address => "value for address",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip"
      )
    ]
  end

  it "should render list of restaurants" do
    render "/restaurants/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for phone", 2)
    response.should have_tag("tr>td", "value for email", 2)
    response.should have_tag("tr>td", "value for address", 2)
    response.should have_tag("tr>td", "value for address2", 2)
    response.should have_tag("tr>td", "value for city", 2)
    response.should have_tag("tr>td", "value for state", 2)
    response.should have_tag("tr>td", "value for zip", 2)
  end
end

