require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/restaurants/show.html.erb" do
  include RestaurantsHelper
  
  before(:each) do
    assigns[:restaurant] = @restaurant = stub_model(Restaurant,
      :name => "value for name",
      :phone => "value for phone",
      :email => "value for email",
      :address => "value for address",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip"
    )
  end

  it "should render attributes in <p>" do
    render "/restaurants/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ address2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
  end
end

