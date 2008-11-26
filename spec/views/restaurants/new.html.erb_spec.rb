require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/restaurants/new.html.erb" do
  include RestaurantsHelper
  
  before(:each) do
    assigns[:restaurant] = stub_model(Restaurant,
      :new_record? => true,
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

  it "should render new form" do
    render "/restaurants/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", restaurants_path) do
      with_tag("input#restaurant_name[name=?]", "restaurant[name]")
      with_tag("input#restaurant_phone[name=?]", "restaurant[phone]")
      with_tag("input#restaurant_email[name=?]", "restaurant[email]")
      with_tag("input#restaurant_address[name=?]", "restaurant[address]")
      with_tag("input#restaurant_address2[name=?]", "restaurant[address2]")
      with_tag("input#restaurant_city[name=?]", "restaurant[city]")
      with_tag("input#restaurant_state[name=?]", "restaurant[state]")
      with_tag("input#restaurant_zip[name=?]", "restaurant[zip]")
    end
  end
end


