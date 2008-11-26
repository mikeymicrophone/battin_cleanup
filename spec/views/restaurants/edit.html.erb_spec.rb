require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/restaurants/edit.html.erb" do
  include RestaurantsHelper
  
  before(:each) do
    assigns[:restaurant] = @restaurant = stub_model(Restaurant,
      :new_record? => false,
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

  it "should render edit form" do
    render "/restaurants/edit.html.erb"
    
    response.should have_tag("form[action=#{restaurant_path(@restaurant)}][method=post]") do
      with_tag('input#restaurant_name[name=?]', "restaurant[name]")
      with_tag('input#restaurant_phone[name=?]', "restaurant[phone]")
      with_tag('input#restaurant_email[name=?]', "restaurant[email]")
      with_tag('input#restaurant_address[name=?]', "restaurant[address]")
      with_tag('input#restaurant_address2[name=?]', "restaurant[address2]")
      with_tag('input#restaurant_city[name=?]', "restaurant[city]")
      with_tag('input#restaurant_state[name=?]', "restaurant[state]")
      with_tag('input#restaurant_zip[name=?]', "restaurant[zip]")
    end
  end
end


