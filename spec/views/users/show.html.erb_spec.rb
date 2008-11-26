require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
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
  end

  it "should render attributes in <p>" do
    render "/users/show.html.erb"
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ middle_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ address2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ password/)
  end
end

