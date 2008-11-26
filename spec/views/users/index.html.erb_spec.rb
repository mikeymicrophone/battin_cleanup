require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
        :email => "value for email",
        :phone => "value for phone",
        :address => "value for address",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip",
        :password => "value for password"
      ),
      stub_model(User,
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
        :email => "value for email",
        :phone => "value for phone",
        :address => "value for address",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip",
        :password => "value for password"
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "value for first_name", 2)
    response.should have_tag("tr>td", "value for middle_name", 2)
    response.should have_tag("tr>td", "value for last_name", 2)
    response.should have_tag("tr>td", "value for email", 2)
    response.should have_tag("tr>td", "value for phone", 2)
    response.should have_tag("tr>td", "value for address", 2)
    response.should have_tag("tr>td", "value for address2", 2)
    response.should have_tag("tr>td", "value for city", 2)
    response.should have_tag("tr>td", "value for state", 2)
    response.should have_tag("tr>td", "value for zip", 2)
    response.should have_tag("tr>td", "value for password", 2)
  end
end

